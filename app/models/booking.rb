class Booking < ApplicationRecord
  scope :current_booking, -> { where("check_in <= ? AND check_out >= ?", Date.today, Date.today).limit(1) }
  scope :upcoming_bookings, -> { where("check_in > ?", Date.today) }
  scope :past_bookings, -> { where("check_out < ?", Date.today) }
  scope :reserved_bookings, -> { upcoming_bookings.where(confirmed: false) }
  scope :confirmed_bookings, -> { upcoming_bookings.where(confirmed: true) }
  scope :last_checked_out, -> { past_bookings.order(:check_out).limit(1) }

  before_validation :set_total_price
  before_validation :set_booleans

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

  def self.available?(check_in, check_out)
    Booking.all.each do |booking|
      if (booking.starts_at <= check_out) && (booking.ends_at >= check_in)
        return false
      end
    end
    # Check if a price is set for all days, if not it is not available.
    (check_in..check_out).each do |date|
      return false unless Price.where("start_date <= ? AND end_date >= ?", date, date).exists?
    end
    true
  end

  def full_name
    "#{title} #{first_name} #{last_name}"
  end

  def full_address_html
    """<br />
    #{street_name} #{street_number} <br />
    #{zip_code} <br />
    #{city} <br />
    #{phone} <br />
    #{email}
    """
  end

  def number_of_days
    (check_out - check_in).to_i - 1
  end

  private
    def set_booleans
      self.confirmed ||= false
      self.paid ||= false
    end

    def set_total_price
      self.total_price ||= Price.total_price(check_in, check_out, people)
    end
end
