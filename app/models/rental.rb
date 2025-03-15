class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validate :book_availability

  before_create :set_rented_at
  before_update :set_returned_at

  private

  def book_availability
    erros.add(:book, "is already rented") unless book.available?
  end

  def set_rented_at
    self.rented_at = Time.now
  end

  def set_returned_at
    if returned_at_changed? && returned_at.present?
      book.update(is_rented: false)
    end
  end
end
