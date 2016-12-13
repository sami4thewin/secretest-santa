class Gift < ApplicationRecord

  belongs_to :user
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
  belongs_to :period

  #belongs to user but a recipient uses a foreign key, recipient id

  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates :link, presence: true
  validates :description, presence: true
  validates :price, presence: true


end
