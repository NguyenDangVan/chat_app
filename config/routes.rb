Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users, controllers: {sessions: "sessions"}
  resources :users, only: :index
  resources :conversations, only: :create do
    resources :messages
  end
end
