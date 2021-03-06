class User < ApplicationRecord
  has_many :restaurants, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :reviewed_restaurants, through: :reviews, source: :restaurant

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def has_reviewed?(restaurant)
    reviewed_restaurants.include? restaurant
  end
end
