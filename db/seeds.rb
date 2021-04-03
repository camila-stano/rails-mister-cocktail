require "faker"
require "open-uri"

puts 'Cleaning up database...'
Cocktail.destroy_all-m
Comment.destroy_all
puts "Database is clean!"

base_url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

puts 'Creating cocktails'
(0..6).to_a.each do |index|
  cocktail = Cocktail.new(name: JSON.parse(open(base_url).read).first[1][index]["strIngredient1"], link_spotify: "https://open.spotify.com/")
  cocktail.photo.attach(io: File.open('app/assets/images/Martini_007.jpg'), filename: 'nes.png', content_type: 'image/png')
  cocktail.save!
  puts "Cocktail #{cocktail.name} is created. Cocktail id: #{cocktail.id}"
end

puts 'Creating comments'
(0..6).to_a.each do |index|
  comment = Comment.new(
    name: Faker::Name.name, 
    email: Faker::Internet.email,
    nacionality: Faker::Address.country,
    comment: Faker::Lorem.sentence(word_count: 10) 
    )
  # comment.photo.attach(io: File.open('app/assets/images/Martini_007.jpg'), filename: 'nes.png', content_type: 'image/png')
  comment.save!
  puts "Comment's user name #{comment.name}. Comment id: #{comment.id}"
end

puts 'All Done!'