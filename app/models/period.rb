class Period < ApplicationRecord

  has_many :period_users
  has_many :users, through: :period_users

  validates :title, presence: true
  validates :price_limit, presence: true

  validates :expiration, :inclusion => {:in => [1,2,3,4,5,6,7,8], :message => "Select between 1-8"}

end
