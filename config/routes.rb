Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete '/cart', to: "carts#destroy"
  resources :items, only: [:index, :show]
  resources :categories, only: [ :index, :show]
  resources :carts
  put   '/carts', to: "carts#update"
  put 'update' => 'carts#update'
  post 'remove_one' => 'carts#remove_one', as: :remove_one
  get '/', to: "items#index"
end
