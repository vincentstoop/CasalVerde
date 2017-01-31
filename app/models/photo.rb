# frozen_string_literal: true
class Photo < ApplicationRecord
  belongs_to :photo_page, polymorphic: true
  mount_uploader :image, ImageUploader
end
