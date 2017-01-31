class Price < ApplicationRecord
  # Check if the current dates are overlapping with something already there.
  def self.not_overlapping?(new_start, new_end)
    Price.all.each do |price|
      return false if (price.start_date <= new_end) && (price.end_date >= new_start)
    end
    true
  end
end
