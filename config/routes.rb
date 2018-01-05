Rails.application.routes.draw do
  root "welcome#index"

  get '/login', to: "sessions#new"
  put '/carts', to: "carts#update"
  delete '/cart', to: "carts#destroy"
  resources :carts, only: [:index, :create]
  resources :items, only: [:index, :show]
  resources :categories, only: [ :index, :show]

end
