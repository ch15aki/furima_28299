Rails.application.routes.draw do
  devise_for :users
  # フロント実装のため仮のルーティング
  root 'items#index'
  get 'items/index'
end
