class ChoiceSerializer < ActiveModel::Serializer
  attributes :title, :created_at, :updated_at, :total_votes

  def total_votes
    object.votes.count
  end
end
