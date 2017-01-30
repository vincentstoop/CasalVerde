class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to reviews_path
    else
      redirect_to reviews_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :stars, :review)
  end
end
