Rails.application.routes.draw do
  devise_for :users
  root to: 'paintings#index'
  resources :paintings do
    resources :reviews, only: [:new, :create]
    resources :requests, only: [:new, :create]
  end
  get '/requests/incoming', to: 'requests#incoming'
  get '/requests/outgoing', to: 'requests#outgoing'
  resources :requests, only: [:show, :update]
end
