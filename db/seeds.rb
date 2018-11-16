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
