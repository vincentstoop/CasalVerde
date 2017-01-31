class Booking < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :title, presence: true
  validates :email, presence: true
  validates :street_name, presence: true
  validates :street_number, presence: true
  validates :zip_code, presence: true
  validates :people, presence: true
  validates :confirmed, presence: true
  validates :paid, presence: true
  validates :total_price, presence: true

end
