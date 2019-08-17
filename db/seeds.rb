require 'faker'

# destroy all
Booking.destroy_all
Character.destroy_all
User.destroy_all

# create random users
3.times do |counter|
  counter += 1
  User.create!(email: "test#{counter}@gmail.com", password: "123456", name: "name#{counter}")
end

# assign 3 random chars to 1st user
character = Character.new(name: "Dashing Pirate Man", price: 200, description: Faker::Lorem.paragraph, user: User.all[0])
character.remote_photo_url = 'https://m.media-amazon.com/images/I/61ahGHzIHbL._SR500,500_.jpg'
character.save

character = Character.new(name: "SuperNinja", price: 250, description: Faker::Lorem.paragraph, user: User.all[0])
character.remote_photo_url = 'https://www.cosplaycostumecloset.com/image/cache/catalog/legavenue/mens-ninja-warrior-adult-costume-8565301104_main-900x900.jpg'
character.save

character = Character.new(name: "PowerDudeRanger", price: 250, description: Faker::Lorem.paragraph, user: User.all[0])
character.remote_photo_url = 'https://images-na.ssl-images-amazon.com/images/I/61s99zq7TCL._UY445_.jpg'
character.save

# assign 3 random chars to 2nd user
character = Character.new(name: "AnimeGirl101", price: 400, description: Faker::Lorem.paragraph, user: User.all[1])
character.remote_photo_url = 'https://images-na.ssl-images-amazon.com/images/I/71NUzTEPIEL._UL1500_.jpg'
character.save!

character = Character.new(name: "Princess Kawaii", price: 400, description: Faker::Lorem.paragraph, user: User.all[1])
character.remote_photo_url = 'https://images-na.ssl-images-amazon.com/images/I/51kR4pFiNSL._UX385_.jpg'
character.save!

character = Character.new(name: "QUEEN PUMPKIN", price: 350, description: Faker::Lorem.paragraph, user: User.all[1])
character.remote_photo_url = 'https://i.pinimg.com/originals/51/b7/29/51b729d57ea69f00bf37c600744effd6.jpg'
character.save!

# assign 3 random chars to 3rd user
character = Character.new(name: "COOL DUDE 69", price: 400, description: Faker::Lorem.paragraph, user: User.all[2])
character.remote_photo_url = 'https://images-na.ssl-images-amazon.com/images/I/61rsh9MYGjL._UY445_.jpg'
character.save!

character = Character.new(name: "Joker", price: 400, description: Faker::Lorem.paragraph, user: User.all[2])
character.remote_photo_url = 'https://images.halloweencostumes.com/products/9104/1-1/grand-heritage-joker-costume1.jpg'
character.save!

character = Character.new(name: "FIREFIGHTER DADDY", price: 350, description: Faker::Lorem.paragraph, user: User.all[2])
character.remote_photo_url = 'https://www.heavencostumes.com.au/media/catalog/product/cache/afad95d7734d2fa6d0a8ba78597182b7/m/u/musl-76618-firefighter-hero-men-s-deluxe-fireman-fancy-dress-costume-1200.jpg'
character.save!

# create testUser
testUser = User.create(email: "aaa@hotmail.com", password: "testtest")

# assign a random char to testUser
character = Character.new(name: "Black Thunder", price: 25, description: Faker::Lorem.paragraph, user: testUser)
character.remote_photo_url = 'https://image.dhgate.com/0x0s/f2-albu-g7-M01-E3-64-rBVaSVrMgMOACNXaAALfdAbfwOc436.jpg/funny-inflatable-pirate-costume-adult-for.jpg'
character.save!


# assign 2 pending bookings to testUser
counter = 0

2.times do
  booking = Booking.new(location: "Shinjuku", date: Date.today, comment: "test")
  booking.user = testUser
  booking.character = Character.all[counter]
  booking.save!
  counter += 1
end

# assign 2 accepted bookings to testUser
booking = Booking.new(status: "Accepted", location: "Shinjuku", date: Date.today, comment: "test")
booking.user = testUser
booking.character = Character.all[counter]
booking.save!
counter += 1

# assign 2 historical bookings to testUser
2.times do
  booking = Booking.new(status: ["Accepted", "Denied", "Cancelled"].sample, location: "Shinjuku", date: Date.today - 10, comment: "test")
  booking.user = testUser
  booking.character = Character.all[counter]
  booking.save!
  counter += 1
end

# assign random booking from testUser to another user
booking = Booking.new(location: "Shinjuku", date: Date.today, comment: "test")
booking.user = User.all.sample
booking.character = Character.first
booking.save!

print "Seed completed successfully"
