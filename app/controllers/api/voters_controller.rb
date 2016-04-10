class Api::VotersController < ApplicationController
  def create
    voter = registration_number.present? ? update_registration! : create_unauthenticated!
    render json: voter, status: 201
  end

  private

  def registration_number
    params[:voter][:registration_number]
  end

  def update_registration!
    Voter
      .find_by(registration_number: registration_number)
      .update_attributes!(voter_params)
  end

  def school
    @school ||= School.find(params[:voter][:school_id])
  end

  def create_unauthenticated
    Voter.create!(voter_params)
  end

  def voter_params
    school_id: school.id,
    gender: params[:voter][:gender],
    will_be_eighteen: params[:voter][:will_be_eighteen],
    school_year: params[:voter][:year_in_school],
  end
end
