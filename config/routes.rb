Rails.application.routes.draw do

  # Autenticação - Administrador
  devise_for :admins

  # Administrativo Geral
  namespace :panel do
    resources :stores
    resources :admins
    resources :segments, except: [:show]
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

  # Rotas
  get 'home/index'
  root to: 'home#index'

  # API
  namespace :api, path: '', defaults: { format: 'json'} do
    namespace :v1 do
       post "/promotions", :to => "promotions#index", as: 'promotions'
       get "/stores/:id", :to => "stores#show", as: 'stores'
    end
  end

end
