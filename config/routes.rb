Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  resources :articles
  resources :users
  post "login", to: "sessions#create"
  post "logout", to: "sessions#destroy"
  get "me", to: "sessions#me"
end
