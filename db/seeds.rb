# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
JoinTableTagGossip.destroy_all

10.times do
  c = City.create!(name: Faker::Address.city)
  User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.first_name, city: c, email: Faker::Internet.email, age: Faker::Number.between(from: 1, to: 100))
  Tag.create!(title: Faker::Lorem.word)
end

20.times do
  Gossip.create!(title: Faker::Lorem.sentence,content: Faker::Lorem.sentence ,user: User.find(rand(User.first.id..User.last.id)))
end

40.times do 
  JoinTableTagGossip.create!(gossip: Gossip.find(rand(Gossip.first.id..Gossip.last.id)), tag: Tag.find(rand(Tag.first.id..Tag.last.id)))
end