class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save!
      redirect_to new_booking_path
    else
      render "new"
    end
  end

private
  def booking_params
    params.require(:booking).permit(:check_in, :check_out, :first_name,
     :last_name, :title, :phone, :email, :street_name, :street_number,
     :city, :zip_code, :people)
  end
end
