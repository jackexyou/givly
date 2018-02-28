Rails.application.routes.draw do
  resources :product_transactions
  resources :products
  resources :transactions
  resources :givings
  resources :merchants
  resources :givers
  resources :recipients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
