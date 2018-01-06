Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sign-up', as: 'sign-up', to: 'users#new'
  # get '/', to: "items#index"


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



  resources :users, only: [:new, :create, :show, :edit, :update ] do
      get '/orders', to: 'orders#index'
      get '/order', to: 'orders#show'
      post '/orders', to: 'orders#create', as: :create
  end

  resources :items, only: [:index, :show]
  resources :categories, only: [ :index]
  get "/:category", to: "categories#show", as: "category"

    namespace :admin do
      get 'dashboard', to: "dashboard#index"
      resources :items
    end

end
