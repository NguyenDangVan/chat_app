Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root "messages#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/signup', to: "users#new"
  resources :users do
    resources :relationships
    resources :messages
    resources :rooms
  end
  resources :rooms do
    resources :user_rooms, only: :destroy
  end
  resources :message_rooms
  resources :relationships
  namespace :searches do
    resources :users, only: :index
  end
end
