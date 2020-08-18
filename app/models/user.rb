class User < ApplicationRecord
  has_many :bookings_by_customer, class_name: 'Booking', foreign_key: :customer_id
  has_many :bookings_by_plant_sitter, class_name: 'Booking', foreign_key: :plant_sitter_id
end
