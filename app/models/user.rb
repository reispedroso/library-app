class User < ApplicationRecord
  has_many :rentals
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
