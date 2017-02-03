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

  def create
    @price = Price.new(price_params)
    if @price.save
      redirect_to admin_prices_path
    else
      redirect_to admin_prices_path
    end
  end

  # PATCH/PUT /admin/prices/:id
  def update
    @price = Price.find(params[:id])
    if @price.update(price_params)
      redirect_to admin_prices_path
    else
      render :edit
    end
  end

  # DELETE /admin/prices/:id
  def destroy
    @price = Price.find(params[:id])
    @price.destroy
    redirect_to admin_prices_path
  end

  def calculate_price
    price = Price.total_price(params:[:checkin], params:[:checkout], params:[:guests])
    if price
      render status: 200, json: {
        price: price
      }.to_json
    else
      render status: 422, json: {
        errors: price.errors
      }.to_json
    end
  end

  private
    def price_params
      params.require(:price).permit(:start_date, :end_date, :min_days,
                     :nightly_price, :extra_price, :service_costs,
                     :saturdays_only)
    end
end
