class Page < ApplicationRecord
  has_many :paragraphs, dependent: :destroy
  has_many :carousels
end
