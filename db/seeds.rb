
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
User.destroy_all
User.create!(email: "admin@example.com", password: "foobar", password_confirmation: "foobar")

# Prices
Price.destroy_all
Price.create!(start_date: "2017-01-01", end_date: "2017-05-31", min_days: 7,
              nightly_price: 400.00, extra_price: 100.00)
# Booking
Booking.destroy_all
Booking.create!(check_in: "2017-02-01", check_out: "2017-02-15", first_name: "Bert",
            last_name: "Ernie", title: "Mr.", phone: 1234,
            email: "BertandErnie@sesamestreet.com", street_name: "Sesame Street",
            street_number: "123", city: ":O", zip_code: "1234 AB", people: 2)

Booking.create!(check_in: "2017-02-16", check_out: "2017-02-28", first_name: "Mike",
            last_name: "Blah", title: "Mr.", phone: 5678,
            email: "mike@example.com", street_name: "Main Street",
            street_number: "30a", city: "Los Angeles", zip_code: "90210", people: 10)

Booking.create!(check_in: "2017-03-10", check_out: "2017-03-30", first_name: "Mary",
            last_name: "Poppins", title: "Mrs.", phone: 9872,
            email: "Mary@poppins.com", street_name: "WhateverStreet",
            street_number: "7320", city: "London", zip_code: "83921", people: 8,
            confirmed: true)
