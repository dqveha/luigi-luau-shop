# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |product_instance|
  product = Product.create!(name: Faker::SlackEmoji.objects_and_symbols,
                            cost: Faker::Number.decimal(l_digits: 2),
                            country_of_origin: Faker::Address.country_code)
  product.update_attributes(:updated_at, Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long))
  
  250.times do |review_instance|
    Review.create!(author: Faker::FunnyName.name,
                  content_body: 
                  Faker::Movies::HitchhikersGuideToTheGalaxy.quote,
                  # Faker::Lorem.paragraph_by_chars(number: 250, supplemental: false)
                  rating: Faker::Number.between(from:1, to: 5),
                  product_id: product.id)
  end
end

p "Created #{Product.count} items, and #{Review.count} reviews"