# frozen_string_literal: true
Rails.application.routes.draw do

  root to: 'pages#index'

  devise_for :users

  resources :pages, only: [:index] do
    get :photogallery, on: :collection
  end
  resources :reviews

  resources :photos
  resources :bookings, only: [:new, :create, :show] do
    get :taken, on: :collection
  end

  namespace :admin do
    get '/', to: 'panel#index'
    get '/past_bookings', to: 'bookings#past', as: 'past_bookings'
    resources :prices, except: [:show, :new]
    resources :bookings, only: [:index, :update, :destroy]
    resources :reviews, only: [:index, :destroy]
    resources :pages
    resources :paragraphs
    resources :photos
  end
end
