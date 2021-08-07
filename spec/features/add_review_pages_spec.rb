require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    test_product = Product.create({:name => "Chef's Knife", :cost => "24.99", :country_of_origin => "Thailand"})
    visit products_path
    within('.find_me') do
      click_on ("Chef\'s Knife")
    end
    click_on ("Add a review")
    fill_in "Author", :with => "Dave"
    fill_in "Rating", :with => "5"
    fill_in "review[content_body]", :with => "It cut through a mountain, like the same way you've seen in a usual anime trope."
    click_on ("Create Review")
    expect(page).to have_content "Dave"
  end

  # it "gives an error when no name is entered" do
  #   visit new_product_path
  #   click_on 'Create Product'
  #   expect(page).to have_content "Name can't be blank"
  # end

end