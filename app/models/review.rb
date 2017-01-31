class Review < ApplicationRecord
  validates :name, presence: true, length: {maximum: 50}
  validates :stars, presence: true, inclusion: 1..5, numericality: {only_integer:true}
  validates :review, presence: true, length: {minimum: 10, maximum: 5000}
end
