Rails.application.routes.draw do
  resources :products
  root 'items#index'
  resources :orders, only: :new
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
