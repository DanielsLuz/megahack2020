Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show] do
    resources :items, only: [:new, :create]
    get 'menu'
  end

  resources :owners, only: [:show, :create, :edit, :update] do
    get 'restaurants/:id', to: 'owners#show_restaurant', as: :restaurant
    get 'time_slots', on: :collection
  end

  post 'owners/tables', to: 'owners#tables_create'

  post 'orders/check_code' => 'orders#check_code'
  resources :orders, only: [:index, :show, :create, :update]

  root to: 'welcome#index'
end
