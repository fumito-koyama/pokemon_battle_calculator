# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pokedex = 'https://raw.githubusercontent.com/kotofurumiya/pokemon_data/master/data/pokemon_data.json'

uri = URI.parse(pokedex)
json = Net::HTTP.get(uri)
hash = JSON.parse(json)

hash.each do |hash|
  next if (hash['name'].length > 5) and (hash['name'].include? 'メガ') or (hash['name'].include? 'ゲンシ')
  poke = {
    number: hash['no'],
    name: hash['name'],
    form: hash['form'].blank? ? nil : hash['form'],
    evolutions: hash['evolutions'].join('/') ,
    types: hash['types'].join('/'),
    abilities: hash['abilities'].join('/'),
    hidden_abilities: hash['hiddenAbilities'][0].blank? ? nil : hash['hiddenAbilities'][0],
    hp: hash['stats']['hp'],
    attack: hash['stats']['attack'],
    defence: hash['stats']['defence'],
    sp_attack: hash['stats']['spAttack'],
    sp_defence: hash['stats']['spDefence'],
    speed: hash['stats']['speed']
  }
  Pokemon.create!(poke)
  end
end