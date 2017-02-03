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

  resources :prices, only: [:calculate_price] do
    get :calculate_price, on: :collection
  end

  namespace :admin do
    get '/', to: 'panel#index'
    get '/past_bookings', to: 'bookings#past', as: 'past_bookings'
    resources :prices, except: [:show, :new]
    resources :bookings, only: [:index, :update, :delete]
    resources :reviews, only: [:index, :delete]
    resources :pages, except: [:show, :edit, :new] do
      resources :paragraphs, except: [:show, :edit, :new]
      resources :photos, except: [:show, :edit, :new]
    end
  end
end
