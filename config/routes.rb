Rails.application.routes.draw do
  resources :games
  devise_for :users
  resources :tournaments
	root to: 'pages#index'
  get 'participate' => 'tournaments#participate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
