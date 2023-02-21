Rails.application.routes.draw do
  devise_for :users
  root "pages#home"

  resources :products do
    resources :bids
  end
  
end
