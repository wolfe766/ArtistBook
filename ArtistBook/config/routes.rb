Rails.application.routes.draw do
  devise_for :businesses
  devise_for :bands
  
  resources :posts
  resources :businesses
  resources :bands, only: [:show]
  resources :responses
  resources :business_requests
  resources :searches
end
