Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  root "static_pages#home"
  #root "conversations#index"
  devise_for :users, controllers: {sessions: "sessions"}
  resources :users do
    resources :groups do
      resources :rooms
    end
  end
  resources :rooms
  resources :conversations do
    resources :messages
  end
end
