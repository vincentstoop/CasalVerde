# frozen_string_literal: true
Rails.application.routes.draw do
  root to: 'pages#index'

  devise_for :users

  resources :pages, only: [:index]
  resources :reviews

  resources :photos
  resources :bookings
  namespace :admin do
    get '/', to: 'panel#index'
    resources :prices, except: [:show]
  end
end
