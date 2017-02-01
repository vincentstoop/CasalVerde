
# frozen_string_literal: true
Carousel.destroy_all
Photo.delete_all

carousel = Carousel.create(name: 'home')

photo1 = Photo.create(remote_image_url: 'https://res.cloudinary.com/casal/image/upload/v1485865015/car1_t7w3fi.jpg',
                      photo_page: carousel)
photo2 = Photo.create(remote_image_url: 'https://res.cloudinary.com/casal/image/upload/v1485865012/car2_xz4nyb.jpg',
                      photo_page: carousel)
photo3 = Photo.create(remote_image_url: 'https://res.cloudinary.com/casal/image/upload/v1485865022/car3_tf1wts.jpg',
                      photo_page: carousel)


# Admin User
User.create!(email: "admin@example.com", password: "foobar", password_confirmation: "foobar")
