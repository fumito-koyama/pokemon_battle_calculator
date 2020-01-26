class PokemonSeed


  class << self

    def read_json
      a = nil
      open(json_path) do |j|
        a = JSON.load(j)
      end
      a
    end

    def parse_create(hash)
      {
        number: hash['number'],
        name: hash['name'],
        updated_generation: (hash['no'].to_i > 809) ? 8:7,
        form: hash['form'].blank? ? nil : hash['form'],
        evolutions: hash['evolutions'],
        types: hash['types'],
        abilities: hash['abilities'],
        hidden_abilities: hash['hidden_abilities'].blank? ? nil : hash['hidden_abilities'],
        hp: hash['hp'],
        attack: hash['attack'],
        defence: hash['defence'],
        sp_attack: hash['sp_attack'],
        sp_defence: hash['sp_defence'],
        speed: hash['speed']
      }
    end

    def parse_update(hash)
      {
        updated_generation: 8, 
        hp: hash['hp'],
        attack: hash['attack'],
        defence: hash['defence'],
        sp_attack: hash['sp_attack'],
        sp_defence: hash['sp_defence'],
        speed: hash['speed']
      }

    end
    def json_path
      File.expand_path('db/seed_base/pokemon_join.json')
    end
  end
end