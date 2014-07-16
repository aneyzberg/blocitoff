require 'faker'

5.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email, 
    password: Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save
end
users = User.all

20.times do
  Todo.create(
    description: Faker::Lorem.word
    )
end
 todos = Todo.all

 User.first.update_attributes(
  email: 'aneyzberg@gmail.com',
  password: 'helloworld',
  )

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{Todo.count} todos created"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
