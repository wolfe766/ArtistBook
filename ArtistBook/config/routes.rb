Rails.application.routes.draw do
  devise_for :businesses
  devise_for :bands
  resources :posts
  resources :businesses
  resources :bands
  resources :responses
  resources :business_requests
  resources :searches


  
  devise_scope :band do 
    unauthenticated :band do
      root to: 'devise/sessions#new', as: 'unathenticated_band_root'
    end
    authenticated :band do
      root to: 'posts#index', as: 'athenticated_band_root'
    end
  end

	devise_scope :business do
  	unauthenticated :business do
      root 'devise/sessions#new', as: 'unathenticated_business_root'
    end
    authenticated :business do
      root 'businesses#index', as: 'athenticated_business_root'
    end
	end

end
