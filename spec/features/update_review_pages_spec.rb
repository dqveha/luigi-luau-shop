require 'rails_helper'

describe "the add a review process" do

  before(:each) do
    Product.destroy_all
    User.destroy_all
    test_admin = User.create!({:email => "a@a.com", :password => "a", :password_confirmation => "a", :admin => true})
    test_product = Product.create({:name => "Chef's Knife", :cost => "24.99", :country_of_origin => "Thailand"})
    test_review = Review.create({:author => "Larry", :rating => "4", :content_body => "It's alright. Maybe a little bit TOO alright. Like so much alright that I don't dare cutting it with anything!", :product_id => test_product.id })
  end

  it "updates a review by the admin" do
    visit signin_path
    fill_in "Email", :with => "a@a.com"
    fill_in "Password", :with => "a"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_on ("Chef\'s Knife")
    click_on ("Larry")
    fill_in "review[author]", :with => "Dave"
    fill_in "Rating", :with => "5"
    fill_in "review[content_body]", :with => "It cuts through a mountain the same way you've seen in a usual anime trope."
    click_on ("Submit")
    expect(page).to have_content "Dave"
  end

end