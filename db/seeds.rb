# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'open-uri'
# require 'json'

require "open-uri"

puts 'Cleaning up database...'
Cocktail.destroy_all
puts "Database is clean!"

base_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

puts 'Creating cocktails'
(0..6).to_a.each do |index|
  # file = URI.open("/Martini_007.jpg")
# 
  cocktail = Cocktail.new(name: JSON.parse(open(base_url).read).first[1][index]["strIngredient1"], link_spotify: "https://open.spotify.com/")
  cocktail.photo.attach(io: File.open('app/assets/images/Martini_007.jpg'), filename: 'nes.png', content_type: 'image/png')
  cocktail.save!
  puts "Cocktail #{cocktail.name} is created. Cocktail id: #{cocktail.id}"
end

puts 'All Done!'