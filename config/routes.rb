Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :reviews
  
  namespace :admin do
    get '/', to: 'panel#index'
    resources :prices, except: [:show]
  end
end
