class ReviewsController < ApplicationController
  before_action :find_restaurant

  def create
    @review = @restaurant.reviews.create(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @review = @restaurant.reviews.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private
    def review_params
      params.require(:review).permit(:body, :rating)
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
end
