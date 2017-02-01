# frozen_string_literal: true
class Carousel < ApplicationRecord
  belongs_to :page
  has_many :photos, as: :photo_page, dependent: :destroy
end
