# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations',
                                    confirmations: 'users/confirmations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  root to: 'home#index'

  get '/auth/failure' => 'omniauth_callbacks#failure'

  resources :chemicals
  resources :categories
end
