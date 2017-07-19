Rails.application.routes.draw do

  root 'home#home'
  get '/signup', to: 'accounts#new'
  post '/signup', to: 'accounts#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :accounts, only:[:index, :destroy]
  resources :account_activations, only:[:edit]
  resources :password_resets, onky:[:new, :create, :edit, :update]
end
