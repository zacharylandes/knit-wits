Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sign-up', as: 'sign-up', to: 'users#new'
  # get '/', to: "items#index"


  root "welcome#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"


  put '/cart', to: "carts#update"
  delete '/cart', to: "carts#destroy"
  get '/cart', to: "carts#show"
  post '/cart', to: "carts#create"

  get '/dashboard', to: 'users#show', as: "dashboard"
  resources :users, only: [:new, :create, :edit, :update ]

  resources :items, only: [:index, :show]

  resources :orders, only: [:show, :edit, :update]

  namespace :admin do
    get 'dashboard', to: "dashboard#index"
    resources :items
  end

  resources :categories, only: [ :index]
  get "/:category", to: "categories#show", as: "category"

end
