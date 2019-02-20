Rails.application.routes.draw do
  resources :games
  devise_for :users
  resources :tournaments
  resources :matches
	root to: 'pages#index'
  get 'participate/:id/:tournament_id', to: 'users#participate', as: 'participate'
  get '/user_tournaments/:id', to: 'users#show_tournaments', as: 'user_tournaments'
  get '/user_games/:id', to: 'users#show_games', as: 'user_games'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
