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

carriers = ["Lincoln", "Principal", "AIG", "Protective", "Banner", "John Hancock", "Prudential"]

products = ["10YT", "15yt", "20yt", "30yt", "GUL", "IUL"]

purposes = ["Personal", "Business"]

rate_classes = ["Preferred Plus", "Preferred", "Standard Plus", "Standard", "Table B", "Table D"]
is_active = ["Active", "Lapsed"]


20.times do
  Policy.create(
    carrier: carriers.sample,
    product: products.sample,
    policy_date: Faker::Date.between(from: '2000-01-01', to: '2020-12-31'),
    policy_number: Faker::Number.number(digits: 10),
    face_amount: Faker::Number.between(from: 100000, to: 5000000),
    conversion_expiry: Faker::Date.between(from: '2023-6-14', to: '2040-01-01'),
    purpose: purposes.sample,
    rate_class: rate_classes.sample,
    client_id: Client.all.sample.id,
    status: is_active.sample
  )
end

puts "✅ Done seeding!"