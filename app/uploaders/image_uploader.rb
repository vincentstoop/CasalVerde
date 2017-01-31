class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    process eager: true
    process resize_to_fill: [800, 350, :north]
  end
end
