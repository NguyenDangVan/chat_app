Rails.application.routes.draw do

  root "static_pages#home"
  #root "conversations#index"
  devise_for :users, controllers: {sessions: "sessions"}
  resources :users do
    resources :groups do
      resources :roooms
    end
  end
  resources :conversations do
    resources :messages
  end
end
