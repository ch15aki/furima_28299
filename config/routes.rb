Rails.application.routes.draw do
  devise_for :users
  # フロント実装のため仮のルーティング
  root 'items#index'
  resources :items, only: [:new, :create]
end
