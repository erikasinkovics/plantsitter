class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :status
      t.references :customer, index: true, foreign_key: { to_table: :users }
      t.references :plant_sitter, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
