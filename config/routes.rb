# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'home#index'
  resources :products, :categories do
    resources :comments, :categories
  end

  resources :products, only: [:index] do
  end

  namespace :api do
    get 'users/email_exists', to: 'users#email_exists'

    resources :products, only: [:index]
  end

  resources :concrete_products, only: [] do
    collection do
      post :add_to_cart
    end
  end
  resources :carts, only: [:index] do
    collection do
      post :confirm
    end
  end

  namespace :user_panel, path: 'user' do
    root to: 'profile#index'

    resources :orders, only: %i[show index] do
      member do
        patch :confirm
      end
    end
  end
end
