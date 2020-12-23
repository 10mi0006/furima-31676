Rails.application.routes.draw do
  resources :comments
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :items do
    resources :orders, only: [:create, :index]
end
end
