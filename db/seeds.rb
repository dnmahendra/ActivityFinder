# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |n|
    name = Faker::Internet.user_name
    email = Faker::Internet.email
    password = '12345'
    gender = 'male'
    age = Faker::Number.between(10, 60)
    avatar = Faker::Avatar.image("100x100")
    location = Faker::Address.city
    User.create!(name: name,
                email: email,
                password_digest: password,
                gender: gender,
                age: age,
                avatar: avatar,
                location: location)
end

# 15.times do |n|
#     title =  Faker::Team.sport 
#     description =  Faker::Hipster.paragraph 
#     location = Faker::Address.city
#     begins = Faker::Date.forward(30)
#     user_id  = Faker::Number.between(1, 10)
#     Activity.create!(title: title, 
#                  description: description,
#                  location: location, 
#                  begins: begins,
#                  user_id: user_id)
#    end 


