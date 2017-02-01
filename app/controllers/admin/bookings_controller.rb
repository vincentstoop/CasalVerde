class Admin::BookingsController < Admin::BaseController
  def index
    @bookings_current = Booking.current_booking
    @bookings_reserved = Booking.reserved_bookings
    @bookings_confirmed = Booking.confirmed_bookings
    # Past bookings on a seperate page?
  end
end
