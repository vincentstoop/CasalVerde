class Admin::ReviewsController < Admin::BaseController

  # GET /admin/prices
  def index
    @reviews = Review.all.order(:created_at)
    @review = Review.new
  end

  # DELETE /admin/prices/:id
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path
  end
end
