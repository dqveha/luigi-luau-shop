# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all
User.destroy_all

50.times do |product_instance|
  product = Product.create!(name: Faker::Beer.brand,
                            cost: Faker::Number.decimal(l_digits: 2),
                            country_of_origin: Faker::Address.country_code,
                            updated_at: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1, format: :long))
  
  5.times do |review_instance|
    Review.create!(author: Faker::FunnyName.name,
                  content_body: 
                  Faker::Lorem.paragraph_by_chars(number: 250, supplemental: false),
                  rating: Faker::Number.between(from:1, to: 5),
                  product_id: product.id,
                  updated_at: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1, format: :long))
  end
end

User.create!({:email => "z@z.com", :password => "z", :password_confirmation => "z", :admin => true})
User.create!({:email => "a@a.com", :password => "a", :password_confirmation => "a", :admin => false})

p "Created #{Product.count} items, #{Review.count} reviews, and #{User.count} accounts."