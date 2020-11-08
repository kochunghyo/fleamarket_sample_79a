Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: 'users/registrations',
  }
  devise_scope :user do
  get 'addresses', to: 'users/registrations#new_address'
  post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'products#index'
  resources :products, only: [:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :mypage, only: :index do
    collection do
      get 'card', to: 'mypage#card'
      get 'card/new', to: 'mypage#card_new'
    end
  end

  resources :creditcard, only: [:new, :show] do
    collection do
      post 'show', to: 'creditcard#show'
      post 'pay', to: 'creditcard#pay'
      post 'delete', to: 'creditcard#delete'
    end
  end

  resources :orders, only: [:new] do
    collection do
      get 'index', to: 'orders#index'
      post 'pay', to: 'orders#pay'
      get 'done', to: 'orders#done'
    end
  end

  
end
