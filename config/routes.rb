Rails.application.routes.draw do

  devise_for :stores, controllers: {
    sessions: 'stores/sessions',
    registrations: 'stores/registrations',
    confirmations: 'stores/confirmations',
    passwords: 'stores/passwords'
  }

  namespace :ad do

    resources :addresses

    get 'dashboard/index'
    root 'dashboard#index'
  
  end

  namespace :api, defaults: { format: 'json'} do
    namespace :v1 do
       get "/promotions",   :to => "promotions#index"
      
    end
    
  end

  get 'home/index'
  root to: 'home#index'

end
