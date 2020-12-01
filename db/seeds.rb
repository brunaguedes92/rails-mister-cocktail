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
file = URI.open('https://www.google.com/url?sa=i&url=https%3A%2F%2Fblog.tudogostoso.com.br%2Fcardapios%2Fmojito-perfeito-confira-a-receita%2F&psig=AOvVaw0AoIR1XnaMZTVsJPvdbImF&ust=1606937460516000&source=images&cd=vfe&ved=2ahUKEwipk63Vwq3tAhXhALkGHUxkBK4QjRx6BAgAEAc')
mojito = Cocktail.create!(name: 'Mojito')
mojito.photo.attach(io: file, filename: 'mojito.jpg', content_type: 'image/jpg')
Dose.create!(description: '6 leaves', ingredient: mint, cocktail: mojito)
Dose.create!(description: '1.5 oz', ingredient: rhum, cocktail: mojito)
