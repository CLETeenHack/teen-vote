class IssueSerializer < ActiveModel::Serializer
  attributes :title, :description, :issue_type_id, :voting_open_time, :voting_closed_time,
             :ordinal, :created_at, :updated_at, :votes_url
  has_many :choices

  def votes_url
    api_votes_url(issue_id: object.id)
  end
end
