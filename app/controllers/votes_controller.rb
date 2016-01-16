class VotesController < ApplicationController
  def index
    api_key = "c32aa663-a302-46b8-b236-e46cc32d160d"
    unless Vote.first
      response = Vote.get_votes_list(api_key)
    end
    @votes = Vote.all
    render json: @votes
  end
end
