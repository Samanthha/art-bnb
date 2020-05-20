Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :paintings do
    resources :reviews, only: [:new, :create]
    resources :requests, only: [:new, :create]
  end
  get '/paintings/:id/delete', to: 'paintings#delete', as: "delete_painting"
  get '/requests/incoming', to: 'requests#incoming', as: "incoming_requests"
  get '/requests/outgoing', to: 'requests#outgoing', as: "outgoing_requests"
  get '/profile', to: 'pages#profile', as: "profile"
  patch '/requests/:id', to: 'requests#update', as: "update_request"
  resources :requests, only: [:show]
end
