# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :store do
    resources :store_products
    resources :store_users
  end

  resources :sales do
    resources :sale_products
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
