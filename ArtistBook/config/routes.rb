Rails.application.routes.draw do
  devise_for :businesses
  devise_for :bands
  
  resources :posts
  resources :businesses, :only [:show]
  resources :band, :only [:show]
  resources :responses
  resources :business_requests
end
