Rails.application.routes.draw do
  get "home/index"
  root "home#index"
  resources :users
  resources :books
  resources :authors
  resources :categories
  resources :rentals
end
