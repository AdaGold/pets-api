# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

owners = ['Ada', 'Kari', 'Dee', 'Dan', 'Alexandra']


20.times do
  Pet.create(
  name: Faker::Space.constellation,
  breed: "Cat",
  age: Random.rand(18),
  owner: owners.sample
  )
end

20.times do
  Pet.create(
  name: Faker::Pokemon.name,
  breed: "Dog",
  age: Random.rand(18),
  owner: owners.sample
  )
end
