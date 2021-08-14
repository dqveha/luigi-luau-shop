require 'rails_helper'

describe "the signup process" do

  before(:each) do
    User.destroy_all
  end

  it "signs up a user" do
    visit signup_path
    fill_in "user[email]", :with => "e@e.com"
    fill_in "user[password]", :with => "e"
    fill_in "user[password_confirmation]", :with => "e"
    within('.find_me') do
      click_on ("Sign up")
    end
    expect(page).to have_content "You've successfully signed up!"
  end

  it "signs up as a non-admin user" do
    visit signup_path
    fill_in "user[email]", :with => "z@z.com"
    fill_in "user[password]", :with => "z"
    fill_in "user[password_confirmation]", :with => "z"
    within('.find_me') do
      click_on ("Sign up")
    end
    visit new_product_path
    expect(page).to have_content "Admins only."
  end

end