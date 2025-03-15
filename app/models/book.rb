class Book < ApplicationRecord
  extend FriendlyId
  belongs_to :author
  belongs_to :category
  has_many :rentals

  validates :title, presence: true
  friendly_id :title, use: :slugged

  def available?
    !is_rented
  end
end
