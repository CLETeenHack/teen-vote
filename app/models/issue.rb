class Issue < ActiveRecord::Base
  belongs_to :issue_type
  has_many :choices
end
