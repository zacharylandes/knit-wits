Rails.application.routes.draw do
  root "welcome#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/dashboard', to: 'users#show', as: "dashboard"
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create', as: 'users'

  put '/carts', to: "carts#update"
  delete '/cart', to: "carts#destroy"
  resources :carts, only: [:index, :create]
  resources :items, only: [:index, :show]
  resources :categories, only: [ :index, :show]
end
