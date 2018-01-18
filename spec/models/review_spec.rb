require 'rails_helper'

RSpec.describe Review, type: :model do
  it "raises an error when a rating over 5 is given" do
    review = Review.create(commenter: "Ellie", body: "Not bad", rating: 6, restaurant_id: 1)
    review.valid?
    review.errors[:rating].should include("must be less than or equal to 5")
  end
end
