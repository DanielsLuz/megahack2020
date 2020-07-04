Rails.application.routes.draw do
  resources :restaurants, only: :index do
    get 'menu'
  end

  resources :owners, only: [:index, :create] do
    get 'time_slots', on: :collection
  end

  post 'owners/tables', to: 'owners#tables_create'

  resources :orders, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
