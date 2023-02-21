Rails.application.routes.draw do
  get "dashboard", to: 'dashboard#index'
  get "dashboard/products", to: "dashboard#product"
  get "dashboard/users" 
  devise_for :users
  root "pages#home"

  resources :products do
    resources :bids
  end
  
end
