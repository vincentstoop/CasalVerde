# frozen_string_literal: true
Rails.application.routes.draw do

  get 'pages/photogallery'

  root to: 'homepages#index'

  devise_for :users

  resources :homepages
  resources :reviews

  namespace :admin do
    get '/', to: 'panel#index'
    resources :prices, except: [:show]
  end
end
