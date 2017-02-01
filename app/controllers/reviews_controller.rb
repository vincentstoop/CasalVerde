class ReviewsController < ApplicationController
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
    @review = Review.new
    render json: @reviews
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to reviews_path(@review)
    else
      render '_form'
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :stars, :review)
  end
end
