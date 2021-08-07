require 'rails_helper'

describe "the edit a product process" do
  it "edits a product" do
    test_product = Product.create({:name => "Chef's Knife", :cost => "24.99", :country_of_origin => "Thailand"})
    visit products_path
    within('.find_me') do
      click_on ("Chef\'s Knife")
    end
    click_on 'Edit'
    fill_in "Name", :with => "Chef's Spoon"
    fill_in "Cost", :with => "79.99"
    fill_in "product[country_of_origin]", :with => "Bowser's Castle"
    click_on 'Update Product'
    expect(page).to have_content "Chef\'s Spoon"
  end

  it "gives an error when no name is entered" do
    test_product = Product.create({:name => "Chef's Knife", :cost => "24.99", :country_of_origin => "Thailand"})
    visit products_path
    within('.find_me') do
      click_on ("Chef\'s Knife")
    end
    click_on 'Edit'
    fill_in "Name", :with => ""
    click_on 'Update Product'
    expect(page).to have_content "Name can't be blank"
  end

end