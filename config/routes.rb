Rails.application.routes.draw do
  namespace 'restaurants' do
    get 'code'
    post 'check_code'
  end

  resources :restaurants, only: [:index, :show] do
    resources :items, only: [:new, :create]
    get 'menu'
    get 'orders'
  end

  resources :owners, only: [:show, :create, :edit, :update] do
    get 'restaurants', to: 'owners#new_restaurant'
    post 'restaurants', to: 'owners#create_restaurant'
    get 'restaurants/:id', to: 'owners#show_restaurant', as: :restaurant
    put 'restaurants/:id', to: 'owners#update_restaurant'
    patch 'restaurants/:id', to: 'owners#update_restaurant'
    delete 'restaurants/:id', to: 'owners#destroy_restaurant'
    get 'restaurants/:id/edit', to: 'owners#edit_restaurant', as: :edit_restaurant
  end

  post 'owners/tables', to: 'owners#tables_create'

  resources :orders, only: [:index, :show, :create, :update] do
    get 'time_slots', on: :collection
    put 'complete'
  end

  root to: 'welcome#index'
end
