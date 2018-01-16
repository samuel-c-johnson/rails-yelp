require 'rails_helper'

RSpec.feature "Adding a new restaurant", type: :feature do

  scenario "User can add a new resturant" do
    visit new_restaurant_path

    fill_in 'restaurant[name]', with: "The Ivy"
    fill_in 'restaurant[description]', with: "Haute cuisine served in a poncy city setting"
    click_button "Save Restaurant"
    expect(page).to have_content "The Ivy"
  end
end

RSpec.feature "Displaying all restaurants", type: :feature do

  scenario "User can add a new resturant" do
    visit new_restaurant_path

    fill_in 'restaurant[name]', with: "The Ivy"
    fill_in 'restaurant[description]', with: "Haute cuisine served in a poncy city setting"
    click_button "Save Restaurant"

    visit new_restaurant_path

    fill_in 'restaurant[name]', with: "Hakkasan"
    fill_in 'restaurant[description]', with: "Colourful sushi"
    click_button "Save Restaurant"

    visit restaurants_path

    expect(page).to have_content "The Ivy"
    expect(page).to have_content "Hakkasan"
  end
end
