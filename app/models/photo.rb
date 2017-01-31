class Photo < ApplicationRecord
  belongs_to :photo_type, polymorphic: true
end
