require 'rails_helper'

describe "the edit a product process" do

  before(:each) do
    Product.destroy_all
    User.destroy_all
    test_user = User.create!({:email => "z@z.com", :password => "z", :password_confirmation => "z", :admin => false})
    test_admin = User.create!({:email => "a@a.com", :password => "a", :password_confirmation => "a", :admin => true})
    test_product = Product.create({:name => "Chef's Knife", :cost => "24.99", :country_of_origin => "Thailand"})
  end

  it "edits a product" do
    visit signin_path
    fill_in "Email", :with => "a@a.com"
    fill_in "Password", :with => "a"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_on ("Chef\'s Knife")
    click_on 'Edit Product'
    fill_in "Name", :with => "Chef's Spoon"
    fill_in "Cost", :with => "79.99"
    fill_in "product[country_of_origin]", :with => "Bowser's Castle"
    click_on 'Submit'
    expect(page).to have_content "Chef\'s Spoon"
  end

  it "gives an error when no name is entered" do
    visit signin_path
    fill_in "Email", :with => "a@a.com"
    fill_in "Password", :with => "a"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_on ("Chef\'s Knife")
    click_on 'Edit Product'
    fill_in "Name", :with => ""
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
  end

  it "does not allow a normal user to edit product" do
    visit signin_path
    fill_in "Email", :with => "z@z.com"
    fill_in "Password", :with => "z"
    within('.find_me') do
      click_on ("Sign in")
    end
    visit products_path
    click_on ("Chef\'s Knife")
    click_on 'Edit Product'
    expect(page).to have_content "Admins only."
  end

  it "does not allow a public user to edit a product" do
    visit products_path
    click_on ("Chef\'s Knife")
    click_on 'Edit Product'
    expect(page).to have_content "Admins only."
  end

end