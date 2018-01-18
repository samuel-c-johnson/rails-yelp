require 'rails_helper'

RSpec.feature "Same user login", type: :feature do
  scenario "should not be able to register users with the same login details" do
    # save_and_open_page
    expect{sign_up(email: "lan@example.com", password: "password", password2: "password")}.to change {User.count}.by 1
    click_on "Sign Out"
    expect{sign_up(email: "lan@example.com", password: "password", password2: "password")}.to change {User.count}.by 0
    # expect{sign_up(email: "lan@example.com", password: "password", password2: "password")}.to raise_error "has already been taken"
  end
end
