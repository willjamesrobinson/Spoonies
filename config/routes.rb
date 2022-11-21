Rails.application.routes.draw do
  get 'spooners/index'
  get 'spooners/new'
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :spooners
end
