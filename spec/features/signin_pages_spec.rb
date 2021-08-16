
require 'rails_helper'

describe "the signin process" do

  before(:each) do
    User.destroy_all
    test_user = User.create!({:email => "z@z.com", :password => "z", :password_confirmation => "z", :admin => false})
  end

  it "signs a user in" do
    visit signin_path
    fill_in "Email", :with => "z@z.com"
    fill_in "Password", :with => "z"
    within('.find_me') do
      click_on ("Sign in")
    end
    save_page
    expect(page).to have_content "You've signed in."
  end

  it "signs a user out" do
    visit signin_path
    fill_in "Email", :with => "z@z.com"
    fill_in "Password", :with => "z"
    within('.find_me') do
      click_on ("Sign in")
    end
    click_on ("Sign out")
    expect(page).to have_content "You've signed out."
  end

end