Rails.application.routes.draw do
  root 'items#index'
  
  resources :mypage, only: :index

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  resources :items, only: [:index, :new]
  resources :products
  root to: "items#index"
end
