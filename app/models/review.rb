# frozen_string_literal: true
class Review < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :stars, presence: true, inclusion: 1..5, numericality: { only_integer: true }
  validates :review, presence: true, length: { minimum: 10, maximum: 5000 }

  def self.last_3_reviews
    reviews = Review.order(created_at: :desc)
    last_3 = []
    [0, 1, 2].each do |l|
      last_3 << reviews[l]
    end
    last_3
  end
end
