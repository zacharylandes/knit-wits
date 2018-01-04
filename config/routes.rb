Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete '/cart', to: "carts#destroy"
  resources :items, only: [:index, :show]
  resources :categories, only: [ :index, :show]
  resources :carts, only: [:index, :create]
  get '/', to: "items#index"
end
