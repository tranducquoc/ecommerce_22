Rails.application.routes.draw do

  scope "(:locale)", :locale => /en|vi/ do
    root "static_pages#index"
    get "/login", to: "sessions#new"
    get "/contact", to: "static_pages#contact"
    get "/help", to: "static_pages#help"
    get "/logout", to: "sessions#logout"
    get "/profile", to: "users#show"
    post "/signup", to: "users#create"
    post "/login", to: "sessions#login"

    resources :users
    resources :statistics, only: :show
    resources :categories
    resources :imports, only: :create
    resources :products
    resources :admins
    resources :products
    resources :rates
    resources :suggests
    resources :carts
    resources :orders

    namespace :admin do
      resources :orders
      resources :rates
      resources :suggests
      resources :carts
      resources :categories
      resources :users
      resources :admins
      resources :products
      resources :orders
    end
  end
end
