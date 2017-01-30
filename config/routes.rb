Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'panel#index'
    resources :prices, except: [:show]
  end
end
