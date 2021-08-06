require 'rails_helper'
require 'pry'

describe Review do
  it { should belong_to(:product) }

  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:content_body) }
  it { should validate_presence_of(:rating) }
  it { should validate_presence_of(:product_id) }

  it("titleizes the author of the review") do
    review = Review.create({author: "ned flanders", content_body: "this is the bestest, grand-didly, doo-dah baking pan. can't wait to show it off to my best friend and neighborino, Homer!", rating: "3", product_id: nil})
    expect(review.author()).to(eq("Ned Flanders"))
  end

  it("capitalizes the beginning of each sentence") do
    review = Review.create({author: "ned flanders", content_body: "this is the bestest, grand-didly, doo-dah baking pan. can't wait to show it off to my best friend and neighborino, Homer!", rating: "3", product_id: nil})
    expect(review.content_body()).to(eq("This is the bestest, grand-didly, doo-dah baking pan. Can't wait to show it off to my best friend and neighborino, Homer!"))
  end
end
