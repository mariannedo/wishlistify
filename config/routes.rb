Wishlistify::Application.routes.draw do
  get "user/index"
  root "home#index"
  #get "/auth/:provider", to: "sessions#create"
  resources :users
end
