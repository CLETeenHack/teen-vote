class Choice < ActiveRecord::Base
  belongs_to :issue
  has_many :votes
end
