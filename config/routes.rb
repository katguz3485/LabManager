# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations',
                                   confirmations: 'users/confirmations'}

  root to: 'home#index'

  get '/auth/failure' => 'omniauth_callbacks#failure'

  resources :categories do
    resources :chemicals, only: [:show, :new,
                                 :edit, :update, :destroy, :create]
  end

  get '/chemicals', to: 'chemicals#index'

  resources :safety_precautions

  resources :items do
    resources :locations
  end
end
