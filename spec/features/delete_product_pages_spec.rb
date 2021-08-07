require 'rails_helper'

describe "the delete a product process" do
  it "deletes a new product" do
    test_product = Product.create({:name => "Chef's Knife", :cost => "24.99", :country_of_origin => "Thailand"})
    visit products_path
    within('.find_me') do
      click_on ("Chef\'s Knife")
    end
    click_on 'Delete product'
    expect(page).to_not have_content "Chef\'s Knife"
  end

end