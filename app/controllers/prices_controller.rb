class PricesController < ApplicationController

  def calculate_price
    price = Price.total_price(check_in, check_out, people)
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

end
