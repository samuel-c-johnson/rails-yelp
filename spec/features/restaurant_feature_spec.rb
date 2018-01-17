require 'rails_helper'

RSpec.feature "Adding a new restaurant", type: :feature do

  scenario "User can add a new resturant" do
    add_restaurant(name: "The Ivy", description: "Haute cuisine served in a poncy city setting")
    expect(page).to have_content "The Ivy"
  end

  scenario "Restaurant count increases by 1 in database" do
    expect { add_restaurant(name: "The Ivy", description: "Haute cuisine served in a poncy city setting") }.to change {Restaurant.count}.by 1
  end

  scenario "Restaurant count doesn't increase when no name given" do
    expect{ add_restaurant(name: nil, description: "Haute cuisine served in a poncy city setting") }.not_to change {Restaurant.count}
  end
end

RSpec.feature "Displaying all restaurants", type: :feature do

  scenario "User can add a new resturant" do
    add_restaurant(name: "The Ivy", description: "Haute cuisine served in a poncy city setting")
    add_restaurant(name: "Hakkasan", description: "Colourful sushi")

    visit restaurants_path

    expect(page).to have_content "The Ivy"
    expect(page).to have_content "Hakkasan"
  end
end

RSpec.feature "Page change buttons", type: :feature do

  scenario "Back button from single view returns restaurants list" do
    visit new_restaurant_path
    add_restaurant(name: "The Ivy", description: "Haute cuisine served in a poncy city setting")
    click_on("Back")
    expect(current_path).to eq restaurants_path
  end

  scenario "New restaurant button" do
    visit restaurants_path
    click_on("New restaurant")
    expect(current_path).to eq new_restaurant_path
  end

  scenario "Back button from the new restaurant path" do
    visit new_restaurant_path
    click_on("Back")
    expect(current_path).to eq restaurants_path
  end

  scenario "Edit button from the current restaurant path" do
    visit new_restaurant_path
    add_restaurant(name: "The Ivy", description: "Haute cuisine served in a poncy city setting")
    visit restaurants_path
    click_on("Edit")
    expect(current_path).to eq '/restaurants/6/edit'
  end
end
