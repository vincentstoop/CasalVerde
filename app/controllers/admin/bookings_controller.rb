class Admin::BookingsController < Admin::BaseController
  def index
    @bookings_current = Booking.current_booking
    @bookings_last = Booking.last_checked_out
    @bookings_reserved = Booking.reserved_bookings
    @bookings_confirmed = Booking.confirmed_bookings
  end

  def past
    @bookings = Booking.past_bookings
  end
end
