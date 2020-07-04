Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show] do
    resources :items, only: [:new, :create]
    get 'menu'
    get 'orders'
  end
  get 'code' => "restaurants#code", as: :restaurant_code
  post 'check_code' => "restaurants#check_code", as: :restaurant_check_code

  resources :owners, only: [:show, :create, :edit, :update] do
    get 'restaurants/:id', to: 'owners#show_restaurant', as: :restaurant
    get 'time_slots', on: :collection
  end

  post 'owners/tables', to: 'owners#tables_create'

  post 'orders/check_code' => 'orders#check_code'
  resources :orders, only: [:index, :show, :create, :update] do
    get 'time_slots', on: :collection
  end

  root to: 'welcome#index'
end
