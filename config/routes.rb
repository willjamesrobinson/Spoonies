Rails.application.routes.draw do
  devise_for :users
  root to: "spooners#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :spooners do
    resources :bookings, only: %i(new create)
  end
  resources :bookings, only: %i(:destroy)
end
