# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  root to: "dashboard#home"

  # Sessions Routes
  get 'sessions/welcome'
  get "/login", to: "sessions#new"
  post 'sessions/create'
  delete "/logout", to: "sessions#destroy"

  resources :companies do
    resources :company_products
    resources :company_users
  end

  resources :operations do
    resources :operation_products
  end

  resources :invoices, except: %i[edit update] do
    resources :invoice_products, only: %i[index show]
  end

  resources :products
  resources :product_statuses
  resources :product_categories

  resources :users
  resources :discounts
  resources :taxes
end
