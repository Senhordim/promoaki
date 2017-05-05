Rails.application.routes.draw do

  # Autenticação - Administrador
  devise_for :admins

  namespace :panel do
    resources :segments, except: [:show]
    resources :admins
    get 'dashboard/index'
    root 'dashboard#index'
  end

  # Autenticação - Loja
  devise_for :stores, controllers: {
    sessions:      'stores/sessions',
    registrations: 'stores/registrations',
    confirmations: 'stores/confirmations',
    passwords:     'stores/passwords'
  }

  # Administrativo
  namespace :ad do
    resources :addresses
    resources :promotions
    get 'dashboard/index'
    root 'dashboard#index'
  end

  # API
  namespace :api, path: '', defaults: { format: 'json'} do
    namespace :v1 do
       post "/promotions", :to => "promotions#index", as: 'promotions'
    end
  end

  # Rotas
  get 'home/index'
  root to: 'home#index'

end
