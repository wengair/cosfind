require 'faker'

# destroy all
User.destroy_all
Character.destroy_all

# create users
counter = 1
5.times do |counter|
  User.create(email: "test#{counter}", password: "password#{counter}", name: "name#{counter}", real_name: Faker::Name.name)
  counter += 1
end

users = User.all

# create characters
10.times do
  Character.create(name: "#{Faker::Superhero.unique.prefix} #{Faker::Superhero.unique.descriptor}", price: Faker::Number.within(range: 100..1000), description: Faker::Lorem.paragraph, photo: Faker::LoremFlickr.image(size: "50x60", search_terms: ['anime']), user_id: users.sample)
end

print "Complete!"
