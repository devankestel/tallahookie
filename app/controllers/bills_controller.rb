class BillsController < ApplicationController
  def index
    api_key = "c32aa663-a302-46b8-b236-e46cc32d160d"
    response = JSON.parse(Bill.get_bills_list(api_key), :symbolize_names => true)
    response_hash = response[:data].each do |r|
      r[:attributes]
    end
    @bills = Bill.all
    binding.pry
    render json: @bills
  end
end
