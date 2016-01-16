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
      Vote.create(t_id: t_id, bill_t_id: bill_t_id, name: names_array)
    end

  end
end
