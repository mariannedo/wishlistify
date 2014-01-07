Wishlistify::Application.routes.draw do
  get "products/index"
  get "add/index"
  get "search", to: "search#index"
  get "user/index"
  root "home#index"
  #get "/auth/:provider", to: "sessions#create"
  resources :users, path: '/wishlist'
  resources :products, path: '/add'
  resources :user_products
end
