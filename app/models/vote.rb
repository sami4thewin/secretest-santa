class Vote < ApplicationRecord

  belongs_to :user
  belongs_to :gift
  validates :tally, presence: true

end
