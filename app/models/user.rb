class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable,
       :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  has_many :period_users
  has_many :periods, through: :period_users

  has_many :gifts
  has_many :comments
  has_many :votes
  has_many :prospects, class_name: "Gift", foreign_key: "recipient_id"

  # validates :name, presence: true


end
