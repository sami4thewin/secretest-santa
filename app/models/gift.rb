class Gift < ApplicationRecord

  belongs_to :user
  #belongs to user but a recipient use a foreign key, recipient id

  has_many :comments
  has_many :votes

  validates :link, presence: true
  validates :description, presence: true
  validates :price, presence: true


end
