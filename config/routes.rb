Rails.application.routes.draw do
  root 'homes#home'

  get '/signup', to: 'accounts#new'
  post '/signup', to: 'accounts#create'
  resources :accounts, only:[:index, :destroy]
end
