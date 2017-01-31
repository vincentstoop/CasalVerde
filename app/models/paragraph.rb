class Paragraph < ApplicationRecord
  belongs_to :page
  has_many :photos, as: :photo_type
end
