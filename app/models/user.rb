class User < ApplicationRecord
  extend FriendlyId
  has_many :rentals
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  friendly_id :name, use: [ :slugged, :history ]
end
