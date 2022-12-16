Rails.application.routes.draw do
  devise_for :users, path: 'd'

  authenticate :user do
    resources :events
    resources :children
    resources :event_days
    resources :schools
    resources :users
    namespace :event_days do
      resources :registrations
    end
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  authenticated :user do
    root to: "events#index", as: :authenticated_root
  end
  root to: redirect("/d/sign_in")
end
