class Photo < ApplicationRecord
  belongs_to :photo_type, polymorphic: true
  mount_uploader :image, ImageUploader
end
