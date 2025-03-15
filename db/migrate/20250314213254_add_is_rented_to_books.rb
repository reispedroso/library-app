class AddIsRentedToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :is_rented, :boolean
  end
end
