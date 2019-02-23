Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root "static_pages#home"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/signup', to: "users#new"
  resources :users do
    resources :relationships
    resources :messages
    resources :rooms do
      resources :message_rooms, only: :create
    end
  end
  resources :rooms do
    resources :user_rooms, only: :destroy
  end
  resources :relationships
end
