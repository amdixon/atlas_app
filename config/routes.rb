AtlasApp::Application.routes.draw do
  
  resources :city
  resources :search_suggestions

  resources :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :profiles
  resources :favorites do
    collection { post :sort }
  end
  
  root to: 'search#index'
  
  # Secure login
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
  
  
end
