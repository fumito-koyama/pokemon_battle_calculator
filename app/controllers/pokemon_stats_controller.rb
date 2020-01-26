class PokemonStatsController < ApplicationController

  def index
    @pokemons = Pokemon.all.order(number: :asc)
  end

  def new
    @pokemon = PokemonStats.new
  end

  def create
    @pokemon = PokemonStats.new(poke_params)
    render :new
  end
  private

  def poke_params
    params.require(:pokemon).permit(:pokemon_id, :name, :level, nature_raise: {}, nature_low:{}, nature: {}, effort_values: {}, individual_values: {})
  end
end
