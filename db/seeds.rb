# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times do |n|
    title =  Faker::Team.sport 
    description =  Faker::Hipster.paragraph 
    location = Faker::Address.city
    begins = Faker::Date.forward(30)
    user_id  = 2
    Activity.create!(title: title, 
                 description: description,
                 location: location, 
                 begins: begins,
                 user_id: user_id)
   end 