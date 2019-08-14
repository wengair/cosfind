require 'faker'

# destroy all
Character.destroy_all
User.destroy_all

# create users
5.times do |counter|
  counter += 1
  User.create!(email: "test#{counter}@gmail.com", password: "123456", name: "name#{counter}", real_name: Faker::Name.name)
end

# create characters
User.all.each do |user|
  2.times do
    character = Character.new(name: "#{Faker::Superhero.unique.prefix} #{Faker::Superhero.unique.descriptor}", price: Faker::Number.within(range: 100..1000), description: Faker::Lorem.paragraph, user: user)
    character.remote_photo_url = 'https://i.imgur.com/gZ9VxN9.jpg'
    character.save!
  end
end

print "Added 5 users and assigned 10 characters randomly"
