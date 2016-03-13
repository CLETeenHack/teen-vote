class Issue < ActiveRecord::Base
  belongs_to :issue_type
  has_many :choices
  has_many :votes
end
