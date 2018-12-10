# frozen_string_literal: true

Rails.application.routes.draw do
  resources :chemicals
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root to: 'home#index'

  get '/auth/failure' => 'omniauth_callbacks#failure'

  resources :chemicals


end
