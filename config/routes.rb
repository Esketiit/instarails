Rails.application.routes.draw do
  root to: "public#homepage"
  get "/home" => "accounts#index"
  get '/signup', to: 'accounts#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:new, :create, :destroy]
  resources :accounts
  resources :followers
  resources :comments
  resources :likes
  resources :posts
 


end
