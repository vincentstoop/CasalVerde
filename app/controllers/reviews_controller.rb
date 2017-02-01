class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html {redirect_to reviews_path, notice: "Thank you for your feedback"}
        format.js {}
        format.json {render json: @review, status: :created, location: @reviews}
      else
        format.html {render action: "index"}
        format.json {render json: @review.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :stars, :review)
  end
end
