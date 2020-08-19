class AddColumntoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :bio, :string
    add_column :users, :postal_code, :string
    add_column :users, :plant_sitter, :boolean
    add_column :users, :pick_up, :boolean
    add_column :users, :price, :integer
  end
end
