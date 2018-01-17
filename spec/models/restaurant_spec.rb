require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it "raises an error when the name is blank" do
    restaurant = Restaurant.new
    restaurant.name = nil
    restaurant.valid?
    restaurant.errors[:name].should include("can't be blank")
  end
end
