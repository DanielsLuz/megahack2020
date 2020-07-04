Rails.application.routes.draw do
  resources :customers, only: :index
  resources :owners, only: :index
  resources :orders, only: :index
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'
end
