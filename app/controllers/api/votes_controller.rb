class Api::VotesController < ApplicationController
  def index
    votes = Issue.find(params[:issue_id]).choices.flat_map { |c| c.votes }
    render json: votes
  end

  def create
    voter = Voter.find_by!(registration_number: params[:vote][:registration_number])
    choice = Choice.find(params[:vote][:choice_id])
    render json: Vote.create!(voter_id: voter.id, choice_id: choice.id), status: 201
  end
end
