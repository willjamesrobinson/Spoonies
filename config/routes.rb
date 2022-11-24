Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "spooners#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :spooners do
    resources :bookings, only: %i[new create]
    resources :reviews, only: %i[create]
  end
  resources :bookings, only: [:destroy]
  get "/bookings/my_bookings", to: "bookings#my_bookings"
  resources :reviews, only: [:destroy]
end
