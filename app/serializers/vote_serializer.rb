class VoteSerializer < ActiveModel::Serializer
  attributes :id, :choice_id, :created_at, :updated_at, :voter_id
end
