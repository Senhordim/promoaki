Rails.application.routes.draw do


  devise_for :stores, controllers: {
    sessions:      'stores/sessions',
    registrations: 'stores/registrations',
    confirmations: 'stores/confirmations',
    passwords:     'stores/passwords'
  }

  namespace :ad do

    resources :addresses
    resources :promotions

    get 'dashboard/index'
    root 'dashboard#index'
  
  end

  namespace :api, path: '', defaults: { format: 'json'} do
    namespace :v1 do
       post "/promotions", :to => "promotions#index", as: 'promotions'
      
    end
    
  end

  get 'home/index'
  root to: 'home#index'

end
