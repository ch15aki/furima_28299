Rails.application.routes.draw do
  # フロント実装のため仮のルーティング
  root 'items#index'
  get 'items/index'
end
