require 'rails_helper'

RSpec.describe User, type: :model do
  it "should not be able to register users with the same login details" do
    User.create(email: "lan@example.com", password: "password", password_confirmation: "password")
    user = User.create(email: "lan@example.com", password: "password", password_confirmation: "password")
    user.valid?
    user.errors[:email].should include("has already been taken")
  end
end
