Rails.application.routes.draw do
  resources :restaurants, only: :index do
    get 'menu'
  end

  post 'owners/tables', to: 'owners#tables_create'
  resources :owners, only: [:index, :create]

  get 'orders/check_code' => 'orders#check_code'
  resources :orders, only: :index

  root to: 'welcome#index'
end
