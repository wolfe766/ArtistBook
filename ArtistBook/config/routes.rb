Rails.application.routes.draw do
  get 'business_profile/profile'

  get 'band_profile/profile'

  get 'developer/about_us'

  get 'developer/developer_info'

  get 'homepage/business'
  get 'homepage/band'
  get 'homepage/home'

  root 'homepage#home'

  devise_for :businesses
  devise_for :bands
  resources :posts
  resources :businesses
  resources :bands
  resources :responses
  resources :business_requests
  resources :searches 
end
