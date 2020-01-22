Rails.application.routes.draw do
  root to: 'individual_pokemons#index'
  resources :individual_pokemons, only: [:new, :create]

end
