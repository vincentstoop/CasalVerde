
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
