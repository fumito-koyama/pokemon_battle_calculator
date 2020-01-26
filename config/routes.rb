Rails.application.routes.draw do
  root to: 'pokemon_stats#index'
  resources :pokemon_stats, only: [:index, :new, :create]

end
