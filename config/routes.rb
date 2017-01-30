Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'panel#index'
  end
end
