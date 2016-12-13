class Gift < ApplicationRecord

  belongs_to :user
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id" 
  #belongs to user but a recipient use a foreign key, recipient id

  has_many :comments
  has_many :votes

  validates :link, presence: true
  validates :description, presence: true
  validates :price, presence: true


end
