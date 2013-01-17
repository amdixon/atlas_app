AtlasApp::Application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  
  # Secure login
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete
  
end
