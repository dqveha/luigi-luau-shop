require 'rails_helper'

describe "the add a product process" do

  before(:each) do
    Product.destroy_all
    User.destroy_all
    test_user = User.create!({:email => "z@z.com", :password => "z", :password_confirmation => "z", :admin => false})
    test_admin = User.create!({:email => "a@a.com", :password => "a", :password_confirmation => "a", :admin => true})
    test_product = Product.create({:name => "Chef's Knife", :cost => "24.99", :country_of_origin => "Thailand"})
  end

  it "adds a new product" do
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
    click_on 'Submit'
    expect(page).to have_content 'Product successfully added'
    expect(page).to have_content "Chef\'s Knife"
  end

  it "gives an error when no name is entered" do
    visit signin_path
    fill_in "Email", :with => "a@a.com"
    fill_in "Password", :with => "a"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit new_product_path
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
  end

  it "gives an error when account is not an admin" do
    visit signin_path
    fill_in "Email", :with => "z@z.com"
    fill_in "Password", :with => "z"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit new_product_path
    expect(page).to have_content "Admins only."
  end

end