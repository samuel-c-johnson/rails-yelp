module Helpers

  def add_restaurant(name: name, description: description)
    visit '/restaurants/new'
    # save_and_open_page
    fill_in 'restaurant[name]', with: name
    fill_in 'restaurant[description]', with: description
    click_button "Create Restaurant"
  end

  def add_and_destroy_restaurant(name: name, description: description)
    add_restaurant(name: name, description: description)
    visit '/restaurants'
    click_on "Delete"
  end

  def add_a_review(commenter: commenter, body: body, rating: rating)

    fill_in 'review[commenter]', with: commenter
    fill_in 'review[body]', with: body
    fill_in 'review[rating]', with: rating
    click_on "Create Review"
  end

  def add_and_destroy_review(commenter: commenter, body: body, rating: rating)
    add_a_review(commenter: commenter, body: body, rating: rating)
    click_on 'Delete review'
  end

  def sign_up(email: email, password: password, password2: password2)
    visit '/users/sign_up'
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password2
    click_button "Sign up"
  end

  # def sign_in(email: email)

end
