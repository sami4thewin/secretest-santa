class Gift < ApplicationRecord

  belongs_to :user

  has_many :comments
  has_many :votes

  validates :link, presence: true
  validates :description, presence: true
  validates :price, presence: true


end
