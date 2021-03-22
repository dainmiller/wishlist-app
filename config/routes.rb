Rails.application.routes.draw do
  root to: 'events#index'

  get '/wishlist', to: 'wishlists#show'

  get 'events/index'
  get 'event/index'

  resources :wishlists do
    resources :products
  end
end
