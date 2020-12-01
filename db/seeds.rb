require 'open-uri'
require 'json'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

response = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
drinks = JSON.parse(response)['drinks']
drinks.each do |drink|
  Ingredient.create!(name: drink['strIngredient1'])
end
mint = Ingredient.create!(name: 'Mint')
rhum = Ingredient.create!(name: 'Rhum')
file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
mojito = Cocktail.create!(name: 'Mojito')
mojito.photo.attach(io: file, filename: 'teste.png', content_type: 'image/png')
Dose.create!(description: '6 leaves', ingredient: mint, cocktail: mojito)
Dose.create!(description: '1.5 oz', ingredient: rhum, cocktail: mojito)
