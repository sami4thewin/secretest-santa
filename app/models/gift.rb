class Gift < ApplicationRecord

  belongs_to :user

  has_many :comments
  has_many :votes


end