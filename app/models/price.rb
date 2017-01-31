class Price < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_cant_be_before_start_date
  validate :not_overlapping

  def end_date_cant_be_before_start_date
   if self.start_date >= self.end_date
     errors.add(:start_date, "Has to be at an earlier date than end date")
   end
  end

  def not_overlapping
    Price.all.each do |price|
      if (price.start_date <= self.end_date) && (price.end_date >= self.start_date) && (self.id != price.id)
        errors.add(:start_date, "Overlaps a current time period")
      end
    end
  end
end
