Rails.application.routes.draw do
  get 'homepage/business'
  get 'homepage/band'

  devise_for :businesses
  devise_for :bands
  resources :posts
  resources :businesses
  resources :bands
  resources :responses
  resources :business_requests
  resources :searches
  


end
