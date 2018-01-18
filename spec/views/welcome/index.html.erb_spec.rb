require 'rails_helper'

RSpec.feature "welcome/index.html.erb", type: :feature do
  before(:each) do
    sign_up(email: "sam_the_man@example.com", password: "555555", password2: "555555")
  end
  
  scenario "Homepage has content" do
    visit "welcome/index"
    expect(page).to have_text "Welcome Yelpers"
  end
end
