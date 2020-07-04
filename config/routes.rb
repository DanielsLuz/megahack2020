Rails.application.routes.draw do
  resources :restaurants, only: :index do
    get 'menu'
  end

  resources :owners, only: [:show, :create, :edit, :update] do
    get 'time_slots', on: :collection
  end

  post 'owners/tables', to: 'owners#tables_create'

  post 'orders/check_code' => 'orders#check_code'
  resources :orders, only: [:index, :show, :create, :update]

  root to: 'welcome#index'
end
