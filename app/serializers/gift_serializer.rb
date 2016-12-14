class GiftSerializer < ActiveModel::Serializer
  attributes :id, :link, :description, :price, :user_id, :recipient_id
  has_many :comments
  has_many :votes
end
