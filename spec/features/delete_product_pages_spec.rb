require 'rails_helper'

describe "the delete a product process" do

  before(:each) do
    Product.destroy_all
    User.destroy_all
    test_user = User.create!({:email => "z@z.com", :password => "z", :password_confirmation => "z", :admin => false})
    test_admin = User.create!({:email => "a@a.com", :password => "a", :password_confirmation => "a", :admin => true})
    test_product = Product.create({:name => "Chef's Knife", :cost => "24.99", :country_of_origin => "Thailand"})
  end

  it "deletes a product if admin" do
    visit signin_path
    fill_in "Email", :with => "a@a.com"
    fill_in "Password", :with => "a"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_on ("Chef\'s Knife")
    click_on 'Delete Product'
    expect(page).to_not have_content "Chef\'s Knife"
  end

  it "cannot delete a product if user" do
    visit signin_path
    fill_in "Email", :with => "z@z.com"
    fill_in "Password", :with => "z"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_on ("Chef\'s Knife")
    click_on 'Delete Product'
    expect(page).to_not have_content "Chef\'s Knife"
  end

  it "will not delete by a public user who is not logged in" do
    visit products_path
    click_on ("Chef\'s Knife")
    click_on 'Delete Product'
    expect(page).to have_content "Admins only."
  end


end