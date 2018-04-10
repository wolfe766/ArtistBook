Rails.application.routes.draw do
  devise_for :businesses
  devise_for :bands
  
  resources :posts
  resources :businesses, only: [:show]
  resources :bands, only: [:show]
  resources :responses
  resources :business_requests
  resources :searches

  #temp: will be changed later
  devise_scope :band do
    root to: "devise/sessions#new"
  end
end
