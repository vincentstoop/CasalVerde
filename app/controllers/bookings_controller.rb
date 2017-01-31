class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to booking
    else
      render "index"
    end
  end

private
  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :first_name,
     :last_name, :title, :phone, :email, :street_name, :street_number,
     :city, :zip_code, :people, :confirmed, :paid, :total_price)
  end
end
