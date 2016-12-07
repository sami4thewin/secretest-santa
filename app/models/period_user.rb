class PeriodUser < ApplicationRecord

  belongs_to :user
  belongs_to :period

end
