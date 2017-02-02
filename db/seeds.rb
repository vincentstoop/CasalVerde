
# frozen_string_literal: true

Carousel.destroy_all
Photo.delete_all
Paragraph.delete_all
Page.delete_all

home_page = Page.create(name: 'home_page')

carousel = Carousel.create(name: 'home', page: home_page)

photo1 = Photo.create(remote_image_url: 'https://res.cloudinary.com/casal/image/upload/v1485865015/car1_t7w3fi.jpg',
                      photo_page: carousel)
photo2 = Photo.create(remote_image_url: 'https://res.cloudinary.com/casal/image/upload/v1485865012/car2_xz4nyb.jpg',
                      photo_page: carousel)
photo3 = Photo.create(remote_image_url: 'https://res.cloudinary.com/casal/image/upload/v1485865022/car3_tf1wts.jpg',
                      photo_page: carousel)


p1 = Paragraph.create(text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel arcu elementum, pretium mi at, sodales turpis. Phasellus vel pellentesque sem. In hac habitasse platea dictumst. Nam pulvinar at neque posuere tempus. Donec efficitur vestibulum elit eu lobortis. Ut at aliquet orci. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis dui justo. Phasellus vitae commodo ipsum, nec laoreet justo. Sed ligula eros, congue at semper id, feugiat in ipsum. Proin pretium, nulla molestie commodo bibendum, sapien velit euismod mi, sit amet pretium leo lectus at mi. Maecenas dignissim et velit eu auctor. Duis enim mi, ullamcorper mattis sapien ut, dapibus tempus ante.', page: home_page)

p2 = Paragraph.create(text: 'Sed faucibus sodales euismod. Fusce blandit semper nunc non aliquet. Morbi at nunc quis nisl sodales imperdiet. Maecenas id tincidunt lectus. Donec pellentesque mollis purus, ut vehicula purus ornare quis. Donec dapibus iaculis augue, sed ornare erat vehicula malesuada. Sed metus diam, pharetra ut commodo a, lobortis nec mauris. Nulla ut est sed justo gravida porta. Duis vestibulum, leo id euismod volutpat, nibh mi molestie tellus, et volutpat urna ligula id ex.', page: home_page)

p3 = Paragraph.create(text: 'Nunc tincidunt feugiat dolor. Integer pretium risus eget augue gravida, nec euismod lectus sollicitudin. Pellentesque iaculis, tortor ut malesuada tincidunt, risus urna efficitur nulla, vitae gravida elit ipsum ac diam. Aliquam tincidunt eleifend arcu, vitae feugiat velit rhoncus non. Phasellus pulvinar ipsum non velit cursus porta. Phasellus non urna auctor, varius massa nec, tristique arcu. Praesent felis libero, dictum sit amet eros a, consectetur iaculis sem.', page: home_page)

# Admin User
User.destroy_all
User.create!(email: "admin@example.com", password: "foobar", password_confirmation: "foobar")

# Prices
Price.destroy_all
Price.create!(start_date: "2016-09-02", end_date: "2016-12-31", min_days: 3,
              nightly_price: 700.00, extra_price: 140.00, service_costs: 500.00)
Price.create!(start_date: "2017-01-01", end_date: "2017-05-31", min_days: 3,
              nightly_price: 400.00, extra_price: 100.00, service_costs: 500.00)
Price.create!(start_date: "2017-06-01", end_date: "2017-08-31", min_days: 3,
              nightly_price: 800.00, extra_price: 140.00, service_costs: 500.00,
              saturdays_only: true)
# Booking
Booking.destroy_all

# Figure out how to avoid validation
Booking.new(check_in: "2016-12-01", check_out: "2016-12-15", first_name: "Past",
            last_name: "Guest", title: "Mr.", phone: 1234,
            email: "Pino@sesamestreet.com", street_name: "Sesame Street",
            street_number: "456", city: "Somewhere", zip_code: "1234 CD", people: 9,
            confirmed: true, paid: true).save(validate: false)

Booking.new(check_in: "2017-02-01", check_out: "2017-02-15", first_name: "Bert",
            last_name: "Ernie", title: "Mr.", phone: 1234,
            email: "BertandErnie@sesamestreet.com", street_name: "Sesame Street",
            street_number: "123", city: ":O", zip_code: "1234 AB", people: 2,
            confirmed: true, paid: true).save(validate: false)

Booking.new(check_in: "2017-02-16", check_out: "2017-02-28", first_name: "Mike",
            last_name: "Blah", title: "Mr.", phone: 5678,
            email: "mike@example.com", street_name: "Main Street",
            street_number: "30a", city: "Los Angeles", zip_code: "90210", people: 10).save(validate: false)

Booking.new(check_in: "2017-03-10", check_out: "2017-03-30", first_name: "Mary",
            last_name: "Poppins", title: "Mrs.", phone: 9872,
            email: "Mary@poppins.com", street_name: "WhateverStreet",
            street_number: "7320", city: "London", zip_code: "83921", people: 8,
            confirmed: true).save(validate: false)

# Reviews
Review.destroy_all

Review.create!(name: "Stefan", stars: 5, review: "It was the most impressive location I've ever been to.")
Review.create!(name: "Andrew", stars: 5, review: "This was incredible.")
Review.create!(name: "Sander", stars: 4, review: "Really cool place. Too bad the wifi was bad.")
Review.create!(name: "Thanos", stars: 4, review: "Amazing. But not Greece.")
Review.create!(name: "Jeroen", stars: 5, review: "Beautifully designed place.")
Review.create!(name: "Vincent", stars: 4, review: "The bars in the area are great. Beautiful house as well.")
