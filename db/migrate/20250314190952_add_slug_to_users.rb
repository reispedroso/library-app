class AddSlugToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true

    add_column :authors, :slug, :string
    add_index :authors, :slug, unique: true

    add_column :books, :slug, :string
    add_index :books, :slug, unique: true

    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true
  end
end
