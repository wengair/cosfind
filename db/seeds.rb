require 'faker'

# destroy all
User.destroy_all
Character.destroy_all

# create users
5.times do |counter|
  counter += 1
  User.create!(email: "test#{counter}@gmail.com", password: "123456", name: "name#{counter}", real_name: Faker::Name.name)
end

# create characters
User.all.each do |user|
  character = Character.new(name: "#{Faker::Superhero.unique.prefix} #{Faker::Superhero.unique.descriptor}", price: Faker::Number.within(range: 100..1000), description: Faker::Lorem.paragraph, user: user)
  character.remote_photo_url = Faker::LoremFlickr.image(size: "300x300", search_terms: ['anime'])
  character.save!
end

print "Added 5 users and assigned 10 characters randomly"
