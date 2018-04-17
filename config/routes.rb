Rails.application.routes.draw do
  resources :product_transactions
  resources :products
  resources :transactions
  resources :merchants
  resources :givings, :only => [:update]
  resources :recipients
  resources :givers do
  	resources :givings, :except => [:update]
  	resources :recipients, :except=> [:show]
  end

  get '/givers/:giver_id/recipients/all', to: 'recipients#all'
  get '/givers/:giver_id/recipients/passed', to: 'recipients#passed' 
  get '/givers/:giver_id/recipients/donated', to: 'recipients#donated' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
