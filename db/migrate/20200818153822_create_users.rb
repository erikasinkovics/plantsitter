class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :postal_code
      t.text :bio
      t.boolean :plant_sitter
      t.boolean :pick_up
      t.integer :price

      t.timestamps
    end
  end
end
