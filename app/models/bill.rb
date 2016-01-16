class Bill < ActiveRecord::Base
  private
  def self.get_bills_list(api_key)
    base_uri = "https://tabsontallahassee.com/api/bills/"
    response = HTTParty.get("#{base_uri}?apikey=#{api_key}&legislative_session=2016")
    response = JSON.parse(response, :symbolize_names => true)
    response[:data].each do |bill|
      id = bill[:id]
      title = bill[:attributes][:title]
      identifier = bill[:attributes][:identifier]
      subject =  bill[:attributes][:subject].map{|s| s.gsub("\\", "")}
      year = bill[:attributes][:legislative_session][:identifier]
      legislative_session = bill[:attributes][:legislative_session][:name]
      Bill.create(t_id: id, title: title, subject: subject, year: year, legislative_session: legislative_session, identifier: identifier)
    end
    Bill.all
  end
end
