class PeriodSerializer < ActiveModel::Serializer
  attributes :id, :title, :expiration, :price_limit
  has_many :users
end
