Rails.application.routes.draw do
  get 'orders/index'
  devise_for :users
  root 'items#index'
  resources :items do
    resources :orders, only: [:new, :create]
  end
end
