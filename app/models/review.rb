class Review < ApplicationRecord
  validates :name, presence: true, length: {minimum: 5, maximum: 50}
  validates :star, presence: true, length: {in: 1..5 }, numericality: {only_integer:true}
  validates :review, presence: true, length: {minimum: 20, maximum: 1000}
end
