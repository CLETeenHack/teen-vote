class RegistrationsController < ApplicationController
  def new
    if session[:voter]
      redirect_to action: 'show', id: 1
    else
      # renders the registration page
      @voter = Voter.new
      @schools = School.all.map { |s| [s.name, s.id] }
    end
  end

  def create
    # 1. Try submitting the test form at /registrations/new and hitting this breakpoint. (explore the 'params' variable)
    # binding.pry

    voter = nil

    # 2. Implement the 'unauthenticated voter' scenario - where the voter needs to be created without a registration number
    if registration_number.blank?
      voter = Voter.create!(voter_params.merge(registration_number: RegistrationNumber.next))
    else
      # 3. Implement the 'authorized voter' scenario - where the voter has a valid registration number.
      voter = Voter.find_by(registration_number: registration_number, school_id: voter_params[:school_id])
      voter.update_attributes!(voter_params)
    end

    # 4. Store the registered user in 'session' (we can discuss what session is)
    session[:voter] = voter
    redirect_to action: 'show', id: 1
  end

  # renders the success page
  def show
    # TODO - Get the registered user from session if present
    @voter = session[:voter]
  end

  private

  def registration_number
    params[:voter][:registration_number]
  end

  def voter_params
    params.require(:voter).permit(:school_id, :gender, :school_year, :will_be_eighteen)
  end
end
