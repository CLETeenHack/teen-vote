class Voter < ActiveRecord::Base
  belongs_to :school
  has_many :votes

  def self.build_authenticated
    create!(authenticated: true, registration_number: RegistrationNumber.next)
  end
end
