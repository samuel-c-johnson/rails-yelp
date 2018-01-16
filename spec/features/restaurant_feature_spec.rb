require 'rails_helper'

RSpec.feature "Adding a new restaurant", type: :feature do

  scenario "User can add a new resturant" do
    # visit "/restaurants/new"
    visit new_restaurant_path

    expect(current_path).to eq "/restaurants/new"
    fill_in 'restaurant[name]', with: "The Ivy"
    fill_in 'restaurant[description]', with: "Haute cuisine served in a poncy city setting"
    click_button "Save Restaurant"
    expect(current_path).to eq "/restaurants"
    expect(page).to have_content "The Ivy"

    end

end
