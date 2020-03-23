Rails.application.routes.draw do
  resources :followers
  resources :comments
  resources :likes
  resources :posts
  resources :accounts
  root to: "public#homepage"
  get "/home" => "accounts#index"
end
