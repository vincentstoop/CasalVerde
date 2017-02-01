class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def show
  end


  def show
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render status: 422, json: {
        errors: @booking.errors
      }.to_json
    end
  end

private
  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :first_name,
     :last_name, :title, :phone, :email, :street_name, :street_number,
     :city, :zip_code, :people)
  end
end
