Rails.application.routes.draw do
  resources :followers
  resources :comments
  resources :likes
  resources :posts
  resources :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
