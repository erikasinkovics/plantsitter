class Booking < ApplicationRecord
  belongs_to :customer, class_name: "User"
  belongs_to :plant_sitter, class_name: "User"
end
