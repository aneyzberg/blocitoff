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

10.times do
  List.create(
    name:   Faker::Lorem.sentence
    )
end
lists = List.all

20.times do
  Todo.create(
    list: lists.sample,
    description: Faker::Lorem.word
    )
end
 todos = Todo.all

admin = User.new(
  name:   'Admin User',
  email:   'admin@example.com',
  password: 'helloworld',
  role:      'admin'
  )
admin.skip_confirmation!
admin.save

moderator = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com',
  password: 'helloworld',
  role:  'moderator'
  )
moderator.skip_confirmation!
moderator.save

member = User.new(
  name: 'Member User', 
  email: 'member@example.com',
  password: 'helloworld',
  )
  member.skip_confirmation!
  member.save


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
