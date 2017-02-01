class Booking < ApplicationRecord
  scope :current_booking, -> { where("check_in <= ? AND check_out >= ?", Date.today, Date.today).limit(1) }
  scope :upcoming_bookings, -> { where("check_in > ?", Date.today) }
  scope :past_bookings, -> { where("check_out < ?", Date.today) }
  scope :reserved_bookings, -> { upcoming_bookings.where(confirmed: false) }
  scope :confirmed_bookings, -> { upcoming_bookings.where(confirmed: true) }

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
  # validates :confirmed, presence: true
  # validates :paid, presence: true
  # validates :total_price, presence: true

  def available?(check_in, check_out)
    bookings.each do |booking|
      if (booking.starts_at <= check_out) && (booking.ends_at >= check_in)
        return false
      end
    end

    true
  end
end
