Rails.application.routes.draw do
  root to: "public#homepage"
  get "/home" => "accounts#index"
  get "/profile" => "accounts#show", as: 'profile'
  get '/signup', to: 'accounts#new', as: 'signup'
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/upload', to: 'posts#new'
  get '/followers/:id', to: 'accounts#followers', as: 'followers'
  get '/followees/:id', to: 'accounts#followees', as: 'followees'
  get '/visit/:id', to: 'accounts#visit', as: 'visit'
  get '/follow/', to: 'followers#new', as: 'follow'
  post '/follow/', to: 'followers#create', as: 'follows'
  resources :comments, only:[:create]
  resources :posts do
    resources :likes
  end
  
  resources :posts, only:[:index, :show, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :followers, only: [:new, :create, :destroy]
  resources :accounts
  # , only: [:show] do
  #   get 'profile', as: 'profile' 
  # end
  # resources :followers
  # resources :comments
  # resources :likes
  
end
