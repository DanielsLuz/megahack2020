Rails.application.routes.draw do
  resources :restaurants, only: :index do
    get 'menu'
  end

  resources :owners, only: [:index, :create] do
    get 'time_slots', on: :collection
  end

  post 'owners/tables', to: 'owners#tables_create'
  resources :owners, only: [:index, :create]

  post 'orders/check_code' => 'orders#check_code'
  resources :orders, only: [:index, :show]

  root to: 'welcome#index'
end
