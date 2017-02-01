class Admin::PricesController < Admin::BaseController

  # GET /admin/prices
  def index
    @prices = Price.all.order(:start_date)
    @price = Price.new
  end

  # GET /admin/prices/:id
  def edit
    @price = Price.find(params[:id])
  end

  # DELETE /admin/prices/:id
  def destroy
    @price = Price.find(params[:id])
    @price.destroy
    redirect_to admin_prices_path
  end

  private
    def price_params
      params.require(:price).permit(:start_date, :end_date, :min_days, :nightly_price, :extra_price)
    end
end
