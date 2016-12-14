class VoteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :gift_id, :tally
  has_one :gift
end
