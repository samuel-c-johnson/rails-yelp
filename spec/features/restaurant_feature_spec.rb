require 'rails_helper'

RSpec.feature "Adding a new restaurant", type: :feature do

  before(:each) do
    sign_up(email: "sam_the_man@example.com", password: "555555", password2: "555555")
  end

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

  before(:each) do
    sign_up(email: "sam_the_man@example.com", password: "555555", password2: "555555")
  end

  scenario "User can add a new resturant" do
    add_restaurant(name: "The Ivy", description: "Haute cuisine served in a poncy city setting")
    add_restaurant(name: "Hakkasan", description: "Colourful sushi")

    visit '/restaurants'

    expect(page).to have_content "The Ivy"
    expect(page).to have_content "Hakkasan"
  end
end

RSpec.feature "Page change buttons", type: :feature do

  before(:each) do
    sign_up(email: "sam_the_man@example.com", password: "555555", password2: "555555")
  end

  scenario "Back button from single view returns restaurants list" do
    add_restaurant(name: "The Ivy", description: "Haute cuisine served in a poncy city setting")
    click_on("Back")
    expect(current_path).to eq '/restaurants'
  end

  scenario "New restaurant button" do
    visit '/restaurants'
    click_on("New Restaurant")
    expect(current_path).to eq new_restaurant_path
  end

  scenario "Back button from the new restaurant path" do
    visit new_restaurant_path
    click_on("Back")
    expect(current_path).to eq '/restaurants'
  end

  scenario "Edit button from the current restaurant path" do
    add_restaurant(name: "The Ivy", description: "Haute cuisine served in a poncy city setting")
    visit '/restaurants'
    click_on("Edit")
    expect(current_path).to eq '/restaurants/6/edit'
  end
end

RSpec.feature "Delete restaurant", type: :feature do

  before(:each) do
    sign_up(email: "sam_the_man@example.com", password: "555555", password2: "555555")
  end

  scenario "User can delete a restaurant" do
    expect{ add_and_destroy_restaurant(name: "McDonalds", description: "Fast food") }.to change {Restaurant.count}.by 0
    expect(page).not_to have_content("McDonalds")
  end
end
