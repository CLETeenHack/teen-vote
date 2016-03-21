class Api::VotesController < ApplicationController
  def index
    votes = Issue.find(params[:issue_id]).choices.flat_map { |c| c.votes }
    render json: votes
  end
end
