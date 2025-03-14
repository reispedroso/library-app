class Author < ApplicationRecord
  has_many :books
  has_many :categories, through: :books
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
end
