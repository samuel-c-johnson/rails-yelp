class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :rating, presence: true,
                     numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5}
  validates :user_id, uniqueness: { scope: :restaurant_id, message: "Users can only write one review per restaurant" }
end
