Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :cars
  resources :orders

  # Defines the root path route ("/")
  # root "articles#index"
end
