Rails.application.routes.draw do

  root "welcome#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/dashboard', to: 'users#show', as: "dashboard"
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create', as: 'users'

  put '/cart', to: "carts#update"
  delete '/cart', to: "carts#destroy"
  get '/cart', to: "carts#show"
  post '/cart', to: "carts#create"

  resources :items, only: [:index, :show]
  resources :categories, only: [ :index]
  get "/:category", to: "categories#show", as: "category"
end
