require 'rails_helper'

describe "the feature a product process" do

  before(:each) do
    Product.destroy_all
    User.destroy_all
    test_user = User.create!({:email => "z@z.com", :password => "z", :password_confirmation => "z", :admin => false})
    test_admin = User.create!({:email => "a@a.com", :password => "a", :password_confirmation => "a", :admin => true})
  end

  it "features a new product" do
    visit signin_path
    fill_in "Email", :with => "a@a.com"
    fill_in "Password", :with => "a"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_link "Add a product"
    fill_in "product[name]", :with => "Chef's Knife"
    fill_in "Cost", :with => "24.99"
    fill_in "product[country_of_origin]", :with => "Thailand"
    page.select "Yes", from: "Feature"
    click_on 'Submit'
    within('.feature') do
      expect(page).to have_content "Chef\'s Knife"
    end
  end

  it "removes product from feature list" do
    visit signin_path
    fill_in "Email", :with => "a@a.com"
    fill_in "Password", :with => "a"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_link "Add a product"
    fill_in "product[name]", :with => "Chef's Knife"
    fill_in "Cost", :with => "24.99"
    fill_in "product[country_of_origin]", :with => "Thailand"
    page.select "Yes", from: "Feature"
    click_on 'Submit'
    within('.feature') do
      click_on "Chef\'s Knife"
    end
    click_on 'Edit Product'
    page.select "No", from: "Feature"
    click_on 'Submit'
    within('.feature') do
      expect(page).to_not have_content "Chef\'s Knife"
    end
    within('.find_me') do
      expect(page).to have_content "Chef\'s Knife"
    end
  end
end