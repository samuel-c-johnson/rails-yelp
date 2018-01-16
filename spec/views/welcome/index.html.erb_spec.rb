require 'rails_helper'

RSpec.feature "welcome/index.html.erb", type: :feature do

  scenario "Homepage has content" do
    visit "welcome/index"
    expect(page).to have_text "Welcome Yelpers"
  end
end
