class Voter < ActiveRecord::Base
  belongs_to :school
  has_many :votes
end
