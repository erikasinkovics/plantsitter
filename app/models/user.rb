class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :bookings_by_customer, class_name: 'Booking', foreign_key: :customer_id
  has_many :bookings_by_plant_sitter, class_name: 'Booking', foreign_key: :plant_sitter_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
