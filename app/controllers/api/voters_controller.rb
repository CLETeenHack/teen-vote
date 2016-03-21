class Api::VotersController < ApplicationController
  def create
    voter = Voter.create!(
      school_id: School.find(params[:voter][:school_id]).id,
      gender: params[:voter][:gender],
      will_be_eighteen: params[:voter][:will_be_eighteen],
      school_year: params[:voter][:year_in_school],
    )
    render json: voter, status: 201
  end
end
