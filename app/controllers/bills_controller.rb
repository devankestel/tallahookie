class BillsController < ApplicationController
  def index
    api_key = "c32aa663-a302-46b8-b236-e46cc32d160d"
    response = JSON.parse(Bill.get_bills_list(api_key), :symbolize_names => true)
    response[:data].each do |bill|
      puts bill[:attributes][:title]
      puts bill[:attributes][:identifier]
      puts bill[:attributes][:legislative_session][:identifier]
      puts bill[:attributes][:legislative_session][:name]
    end
    @bills = Bill.all
    #binding.pry
    render json: @bills
  end
end
