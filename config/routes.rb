Rails.application.routes.draw do
  root to: 'wishlists#show'

  get '/wishlist', to: 'wishlists#show'

  get 'events/index'
  get 'event/index'

  get '/products', to: 'products#index'

  resources :wishlists do
    resources :products
  end
end
