# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

10.times do
  User.create( # create 10 users
    first_name: Faker::Name.first_name, # with a first name
    last_name: Faker::Name.last_name, # with a last name
    email: Faker::Internet.email, # with an email
    password: Faker::Internet.password(min_length: 8) # with a password
  )
end

10.times do
  car = Car.new( # create 10 cars
    brand: Faker::Vehicle.make, # with a brand
    price: Faker::Number.decimal(l_digits: 3, r_digits: 2), # with a price
    user_id: Faker::Number.between(from: 1, to: 10) # with a user_id
  )
  car.save! # save the car
  car.model = Faker::Vehicle.model(make_of_model: "#{car.brand}") # with a model
  car.save!
end
