Rails.application.routes.draw do
  root "users#index"
  resources :articles
  resources :users
  post "login", to: "sessions#create"
  post "logout", to: "sessions#destroy"
  get "me", to: "sessions#me"
  resources :categories
end
