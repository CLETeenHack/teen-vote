class Voter < ActiveRecord::Base
  belongs_to :school
  def self.build_authenticated
    create!(authenticated: true, registration_number: RegistrationNumber.next)
  end
end
