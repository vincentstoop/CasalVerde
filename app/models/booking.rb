class Booking < ApplicationRecord
  validates :check_in, presence: true
  validates :check_out, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :street_name, presence: true
  validates :street_number, presence: true
  validates :city, presence: true
  validates :zip_code, presence: true
  validates :people, presence: true
  validates :confirmed, presence: true
  validates :paid, presence: true
  validates :total_price, presence: true

  def available?(check_in, check_out)
    bookings.each do |booking|
      if (booking.starts_at <= check_out) && (booking.ends_at >= check_in)
        return false
      end
    end

    true
  end
end
