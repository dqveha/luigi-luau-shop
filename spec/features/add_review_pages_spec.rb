require 'rails_helper'

describe "the add a review process" do

  before(:each) do
    Product.destroy_all
    User.destroy_all
    test_user = User.create!({:email => "z@z.com", :password => "z", :password_confirmation => "z", :admin => false})
    test_admin = User.create!({:email => "a@a.com", :password => "a", :password_confirmation => "a", :admin => true})
    test_product = Product.create({:name => "Chef's Knife", :cost => "24.99", :country_of_origin => "Thailand"})
  end

  it "adds a new review by user" do
    visit signin_path
    fill_in "Email", :with => "z@z.com"
    fill_in "Password", :with => "z"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_on ("Chef\'s Knife")
    click_on ("Add Review")
    fill_in "Author", :with => "Dave"
    fill_in "Rating", :with => "5"
    fill_in "review[content_body]", :with => "It cuts through a mountain the same way you've seen in a usual anime trope."
    click_on ("Submit")
    expect(page).to have_content "Dave"
  end

  it "gives an error when no author is entered" do
    visit signin_path
    fill_in "Email", :with => "z@z.com"
    fill_in "Password", :with => "z"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_on ("Chef\'s Knife")
    click_on ("Add Review")
    click_on ("Submit")
    expect(page).to have_content "Author can't be blank"
  end

  it "adds a new review by the admin" do
    visit signin_path
    fill_in "Email", :with => "a@a.com"
    fill_in "Password", :with => "a"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_on ("Chef\'s Knife")
    click_on ("Add Review")
    fill_in "Author", :with => "Dave"
    fill_in "Rating", :with => "5"
    fill_in "review[content_body]", :with => "It cuts through a mountain the same way you've seen in a usual anime trope."
    click_on ("Submit")
    expect(page).to have_content "Dave"
  end

  it "gives a notice user is not logged in" do
    visit products_path
    click_on ("Chef\'s Knife")
    click_on ("Add Review")
    expect(page).to have_content "You need to sign in to view this page."
  end
end