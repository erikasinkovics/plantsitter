# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning database..."
User.destroy_all

puts "Creating customers..."

5.times {
  attributes = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    postal_code: "H2H",
    password: "password",
    bio: Faker::Games::LeagueOfLegends.quote,
    plant_sitter: false,
  }
  User.create!(attributes)
}

puts "Creating plant sitters..."

5.times {
  attributes = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    postal_code: "H2H",
    password: "password",
    bio: Faker::Games::LeagueOfLegends.quote,
    plant_sitter: true,
    pick_up: true,
    price: (5..10).to_a.sample
  }
  User.create!(attributes)
}

puts "Creating bookings..."

customers = User.where(plant_sitter: false)
plant_sitters = User.where(plant_sitter: true)

5.times {
  attributes = {
    start_date: "07/09/2020",
    end_date: "13/09/2020",
    customer_id: customers.sample.id,
    plant_sitter_id: plant_sitters.sample.id
  }
  Booking.create!(attributes)
}

puts "Finished!"
