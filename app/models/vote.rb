class Vote < ActiveRecord::Base
  has_one :bill
  private
  def self.get_votes_list(api_key)
    base_uri = "https://tabsontallahassee.com/api/votes/"
    base_uri_2 =  "https://tabsontallahassee.com/api/"
    response = HTTParty.get("#{base_uri}?apikey=#{api_key}&legislative_session=2016")
    response = JSON.parse(response, :symbolize_names => true)
    response[:data].each do |vote|
      #puts vote[:id]
      t_id = vote[:id]
      bill_t_id =  vote[:relationships][:bill][:data][:id]
      v_response = HTTParty.get("#{base_uri_2}#{t_id}/?apikey=#{api_key}")
      v_response = JSON.parse(v_response, :symbolize_names => true)
      #puts v_response[:data].keys
      names_array = []
      v_response[:data][:attributes][:votes].each do |i_vote|
         #puts  i_vote[:voter_name]
         #puts  i_vote[:option]
         names_array << "#{i_vote[:voter_name]}: #{i_vote[:option]}"
      end
      #puts names_array
       vote = Vote.create(t_id: t_id, bill_t_id: bill_t_id, name: names_array)

       if Bill.find_by(t_id: bill_t_id)
        Bill.find_by(t_id: bill_t_id).update(vote_id: vote.id)
      else
        b_response = HTTParty.get("#{base_uri_2}#{bill_t_id}/?apikey=#{api_key}")
        b_response = JSON.parse(b_response, :symbolize_names => true)
        puts b_response[:data][:attributes][:legislative_session][:name]
        year = b_response[:data][:attributes][:legislative_session][:identifier]
        identifier = b_response[:data][:attributes][:identifier]
        title = b_response[:data][:attributes][:title]
        Bill.create(title: title, identifier: identifier, year: year, vote_id: vote.id)


      end
    end

  end
end
