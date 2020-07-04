Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show] do
    resources :items, only: [:new, :create]
    get 'menu'
    get 'orders'
  end

  resources :owners, only: [:show, :create, :edit, :update]

  post 'owners/tables', to: 'owners#tables_create'

  post 'orders/check_code' => 'orders#check_code'
  resources :orders, only: [:index, :show, :create, :update] do
    get 'time_slots', on: :collection
  end

  root to: 'welcome#index'
end
