Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sign-up', as: 'sign-up', to: 'users#new'
  get '/', to: "items#index"
  put '/cart', to: "carts#update"
  delete '/cart', to: "carts#destroy"
  get '/cart', to: "carts#show"
  post '/cart', to: "carts#create"
  resources :users, only: [:new, :create, :show]
  resources :items, only: [:index, :show]
  resources :categories, only: [ :index]
  get "/:category", to: "categories#show", as: "category"
end
