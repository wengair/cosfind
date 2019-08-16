require 'faker'

# destroy all
Booking.destroy_all
Character.destroy_all
User.destroy_all

# create random users
5.times do |counter|
  counter += 1
  User.create!(email: "test#{counter}@gmail.com", password: "123456", name: "name#{counter}", real_name: Faker::Name.name)
end

# assign 3 random chars to random users
5.times do |user|
  character = Character.new(name: "#{Faker::Superhero.unique.prefix} #{Faker::Superhero.unique.descriptor}", price: Faker::Number.within(range: 100..1000), description: Faker::Lorem.paragraph, user: User.all.sample)
  character.remote_photo_url = 'https://i.imgur.com/gZ9VxN9.jpg'
  character.save!
end

# create testUser
testUser = User.create(email: "aaa@hotmail.com", password: "testtest")

# assign 5 random chars to testUser
5.times do
  character = Character.new(name: "#{Faker::Superhero.unique.prefix} #{Faker::Superhero.unique.descriptor}", price: Faker::Number.within(range: 100..1000), description: Faker::Lorem.paragraph, user: testUser)
  character.remote_photo_url = 'https://i.imgur.com/gZ9VxN9.jpg'
  character.save!
end

# assign 3 pending bookings to testUser
counter = 0

3.times do
  booking = Booking.new(location: "Shinjuku", date: Date.today, comment: "test")
  booking.user = testUser
  booking.character = Character.all[counter]
  booking.save!
  counter += 1
end

# assign 3 accepted bookings to testUser
3.times do
  booking = Booking.new(status: "Accepted", location: "Shinjuku", date: Date.today, comment: "test")
  booking.user = testUser
  booking.character = Character.all[counter]
  booking.save!
  counter += 1
end

# assign 3 historical bookings to testUser
3.times do
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
