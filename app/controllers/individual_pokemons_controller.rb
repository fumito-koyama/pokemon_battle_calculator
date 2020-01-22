class IndividualPokemonsController < ApplicationController

  def index
    @pokemons = Pokemon.all
  end

  def new
    @pokemon = Individual.new(poke_params)
  end

  def create
    pokemon = IndividualPokemon.new(poke_params)
    if pokemon.valid?
      (cookie[:pokemons] = []) unless cookie[:pokemons].class == Array
      cookie[:pokemons] << pokemon.json
    else
      render :new
    end
  end

  private

  def poke_params
    params.require(:pokemon).permit(:pokemon_id,:pokemon_id, :name, :nature, :ability, :effort_values, :moves)
  end
end
