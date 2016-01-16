class Bill < ActiveRecord::Base
  private
  def self.get_bills_list(api_key)
    base_uri = "https://tabsontallahassee.com/api/bills/"
    response = HTTParty.get("#{base_uri}?apikey=#{api_key}&legislative_session=2016")
  end
end
