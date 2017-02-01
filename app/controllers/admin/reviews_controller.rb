class Admin::ReviewsController < Admin::BaseController

  # GET /admin/prices
  def index
    @reviews = Review.all.order(:created_at)
    @review = Review.new
  end

  # GET /admin/prices/:id
  def edit
    @review = Review.find(params[:id])
  end

  # POST /admin/prices
  def create
    @price = Price.new(price_params)

    if @price.save
      redirect_to admin_prices_path
    else
      redirect_to admin_prices_path, notice: "Can't save - invalid data."
    end
  end

  # PUT/PATCH /admin/prices/:id
  def update
    @price = Price.find(params[:id])

    if @price.update(price_params)
      redirect_to admin_prices_path
    else
      redirect_to admin_prices_path, notice: "Can't save - invalid data."
    end
  end

  # DELETE /admin/prices/:id
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to admin_reviews_path
  end

  private
    def price_params
      params.require(:price).permit(:start_date, :end_date, :min_days, :nightly_price, :extra_price)
    end
end
