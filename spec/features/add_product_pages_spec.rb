require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link "Add a product"
    fill_in "Name", :with => "Chef's Knife"
    fill_in "Cost", :with => "24.99"
    fill_in "product[country_of_origin]", :with => "Thailand"
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added'
    expect(page).to have_content "Chef\'s Knife"
  end





end