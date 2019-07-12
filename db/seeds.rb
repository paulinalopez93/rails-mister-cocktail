# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Ingredient.delete.all
require 'json'
require 'open-uri'
require 'faker'
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

puts 'Clearing database...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_json = open(url).read
ingredient_hash = JSON.parse(ingredient_json)

drinks_array = ingredient_hash['drinks']

drinks_array.each do |drink|
  Ingredient.create(name: drink['strIngredient1'])
end

puts "Seed successful!"

puts 'Creating cocktails...'


20.times do
  url = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'
  cocktail_json = open(url).read
  cocktail_hash = JSON.parse(cocktail_json)

  cocktails_array = cocktail_hash["drinks"]
  # p cocktails_array
  cocktails_array.each do |drink|
    # p drink
    p "Creating #{drink['strDrink']}"
    Cocktail.create!(photo: drink['strDrinkThumb'],
                    name: drink['strDrink'])
  end
end

# 10.times do
#   puts "Creating a cocktail"
  # Cocktail.create!(
#     name: Faker::Cannabis.strain,
    # photo: "")
# end

puts "finished!"
