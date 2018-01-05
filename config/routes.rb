Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: "items#index"
  put '/cart', to: "carts#update"
  delete '/cart', to: "carts#destroy"
  get '/cart', to: "carts#show"
  post '/cart', to: "carts#create"
  get '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  resources :items, only: [:index, :show]
  resources :categories, only: [ :index]
  get "/:category", to: "categories#show", as: "category"
end
