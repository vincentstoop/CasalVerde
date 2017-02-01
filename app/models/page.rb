class Page < ApplicationRecord
  has_many :paragraphs
  has_many :carousels
end
