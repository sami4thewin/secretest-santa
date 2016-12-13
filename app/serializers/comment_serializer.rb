class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :gift_id, :text
end
