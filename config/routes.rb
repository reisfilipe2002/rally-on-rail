Rails.application.routes.draw do
  root to: "pages#home"
  devise_for :users

  resources :cars do
    collection do
      get 'brand/:brand', action: 'brand', as: 'brand'
      get 'model/:model', action: 'model', as: 'model'
      get 'price/:price', action: 'price', as: 'price'
      get "my_cars", action: "my_cars", as: "my_cars"
    end
  end



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :cars do
    resources :orders, only: [:create]
  end
  resources :orders, only: [:index,:show]
end
