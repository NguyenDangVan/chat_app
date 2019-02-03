Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users, controllers: {sessions: "sessions"}
  resources :users
  resources :conversations do
    resources :messages
  end
end
