class Vote < ActiveRecord::Base
  attr_accessible :choice_id, :voter_id, :voter, :choice
  belongs_to :voter
  belongs_to :choice
end
