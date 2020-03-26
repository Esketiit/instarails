Rails.application.routes.draw do
  root to: "public#homepage"
  get "/home" => "accounts#index"
  get "/profile" => "accounts#show"
  get '/signup', to: 'accounts#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/upload', to: 'posts#new'

  resources :posts, only:[:index, :show, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :accounts
  # , only: [:show] do
  #   get 'profile', as: 'profile' 
  # end
  # resources :followers
  # resources :comments
  # resources :likes
  
 


end
