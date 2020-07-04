Rails.application.routes.draw do
  resources :customers, only: :index

  resources :owners, only: [:show, :create, :edit, :update]
  post 'owners/tables', to: 'owners#tables_create'

  resources :orders, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
