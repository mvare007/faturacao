# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :sales
  resources :sale_products

  resources :products
  resources :product_statuses

  resources :users
  resources :discounts
end
1
