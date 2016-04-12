class RegistrationsController < ApplicationController
  def new
    # renders the registration page
    @voter = Voter.new
    @schools = School.all.map { |s| [s.name, s.id] }
  end
  
  def create
    # TODO START #######################
    # 1. Try submitting the test form at /registrations/new and hitting this breakpoint. (explore the 'params' variable)
    binding.pry
    
    # 2. Implement the 'unauthenticated voter' scenario - where the voter needs to be created without a registration number
    
    # 3. Implement the 'authorized voter' scenario - where the voter has a valid registration number.
  
    # 4. Store the registered user in 'session' (we can discuss what session is)  
    
    # TODO END #########################
  end
  
  def show
    # renders the success page
    # TODO - Get the registered user from session if present
  end
end