AtlasApp::Application.routes.draw do
  
  resources :city
  resources :search_suggestions

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  root to: 'search#index'
  
  # Secure login
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
end
