Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: 'users/registrations',
  }
  devise_scope :user do
  get 'addresses', to: 'users/registrations#new_address'
  post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'products#index'
  resources :products, only: [:index, :new, :create, :destroy]
  resources :orders, only: :new
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :mypage, only: :index
end
