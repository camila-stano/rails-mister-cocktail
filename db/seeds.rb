# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

base_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks = JSON.parse(open(base_url).read).first[1]

puts 'Cleaning up database...'
Ingredient.destroy_all
puts "Database is clean!"


puts 'Creating Ingredients'
(0..50).to_a.each do |index|
  ingredient = Ingredient.create(
    name: drinks[index].values.first
  )
  puts "Ingredient #{ingredient.id} is created."
end

puts 'All Done!'