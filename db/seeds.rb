# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
 puts "seeding angels..."
 100.times do
  a = Angel.new(
    first_name: Faker::Cannabis.cannabinoid,
    last_name: Faker::Cannabis.strain ,
    phone_number: rand(10000000),
    user_id: 1
    )
  a.save!
end
 puts "seed complete!!! :)"
