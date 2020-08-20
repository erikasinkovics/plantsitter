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

postal_codes = ["H2H 1A1", "H2H 1A2", "H2H 1A3", "H2H 1A4", "H2H 1A5", "H2H 1A6", "H2H 1A7", "H2H 1A8", "H2H 1A9", "H2H 1B1"]

5.times {
  attributes = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{Faker::Name.first_name.downcase}.#{Faker::Name.last_name.downcase}@plantlover.com",
    postal_code: postal_codes.sample,
    password: "password",
    bio: Faker::Games::LeagueOfLegends.quote,
    plant_sitter: false,
  }
  User.create!(attributes)
}

User.create!({
    first_name: "Karine",
    last_name: Faker::Name.last_name,
    email: "karine@gmail.com",
    postal_code: "H2H 1C1",
    password: "password",
    bio: "Hi! I'm Karine. I'm a 28 years old plant enthusiast from Montreal, proud plant-mom of 15.",
    plant_sitter: false,
  })

puts "Creating plant sitters..."

5.times {
  attributes = {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "#{Faker::Name.first_name.downcase}.#{Faker::Name.last_name.downcase}@plantlover.com",
    postal_code: postal_codes.sample,
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
