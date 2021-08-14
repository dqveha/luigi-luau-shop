require 'rails_helper'
require 'pry'

describe Review do
  it { should belong_to(:product) }

  it { should validate_presence_of(:author) }
  it { should validate_length_of(:content_body).is_at_least(50) }
  it { should validate_length_of(:content_body).is_at_most(250) }
  it { should allow_value(1).for(:rating) }
  it { should allow_value(2).for(:rating) }
  it { should allow_value(3).for(:rating) }
  it { should allow_value(4).for(:rating) }
  it { should allow_value(5).for(:rating) }
  it { should validate_presence_of(:product_id) }
  

  it("titleizes the author of the review") do
    product = Product.create({name: "chef's knife", cost: 24.99, country_of_origin: "thailand"})
    review = Review.create({author: "ned flanders", content_body: "this is the bestest, grand-didly, doo-dah baking pan!", rating: "3", product_id: product.id})
    # binding.pry
    expect(review.author()).to(eq("Ned Flanders"))
  end

  it("capitalizes the beginning of each sentence") do
    product = Product.create({name: "chef's knife", cost: 24.99, country_of_origin: "thailand"})
    review = Review.create({author: "ned flanders", content_body: "this is the bestest, grand-didly, doo-dah baking pan!", rating: "3", product_id: product.id})
    expect(review.content_body()).to(eq("This is the bestest, grand-didly, doo-dah baking pan!"))
  end
end
