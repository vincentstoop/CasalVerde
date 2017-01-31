# frozen_string_literal: true
class Carousel < ApplicationRecord
  has_many :photos, as: :photo_type
end
