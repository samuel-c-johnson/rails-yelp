module Helpers

  def add_restaurant(name: name, description: description)
    visit new_restaurant_path

    fill_in 'restaurant[name]', with: name
    fill_in 'restaurant[description]', with: description
    click_button "Create Restaurant"
  end

  def add_and_destroy_restaurant(name: name, description: description)
    add_restaurant(name: name, description: description)
    visit '/restaurants'
    click_on "Delete"
  end

end
