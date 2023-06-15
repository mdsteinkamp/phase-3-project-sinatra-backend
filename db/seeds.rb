puts "🌱 Seeding..."

10.times do
  Client.create(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    date_of_birth: Faker::Date.between(from: '1930-01-01', to: '2005-01-01'),
    state: Faker::Address.state,
    spouse_name: Faker::Name.name || nil
  )
end

puts "✅ Done seeding!"
