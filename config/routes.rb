Rails.application.routes.draw do
  resources :events
  resources :children
  resources :schools
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users

  # Defines the root path route ("/")
  root "users#index"
end
