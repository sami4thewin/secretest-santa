class Period < ApplicationRecord

  has_many :period_users, dependent: :destroy
  has_many :users, through: :period_users
  has_many :gifts

  validates :title, presence: true
  validates :price_limit, presence: true

  validates :expiration, :inclusion => {:in => [1,2,3,4,5,6,7,8], :message => "Select between 1-8"}

  def expiration_date
    case self.expiration
    when 1
      self.created_at + 1.week
    when 2
      self.created_at + 2.week
    when 3
      self.created_at + 3.week
    when 4
      self.created_at + 4.week
    when 5
      self.created_at + 5.week
    when 6
      self.created_at + 6.week
    when 7
      self.created_at + 7.week
    when 8
      self.created_at + 8.week
    end
  end

  def expired?
    Time.now > self.expiration_date
  end

  def self.destroy_expired
    self.all.each do |period|
      if period.expired?
        period.destroy
      end
    end
  end

  def time_left
    t = self.expiration_date - Time.now
    mm, ss = t.divmod(60)
    hh, mm = mm.divmod(60)
    dd, hh = hh.divmod(24)
    "So you have %d days, %d hours, %d minutes, and %d seconds left before this event ends." % [dd, hh, mm, ss]
  end

end
