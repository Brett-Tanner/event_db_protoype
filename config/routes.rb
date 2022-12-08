Rails.application.routes.draw do
  resources :events
  resources :children
  resources :event_days
  resources :registrations
  resources :schools
  devise_for :users, path: 'u'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users

  # Defines the root path route ("/")
  root "events#index"
end
