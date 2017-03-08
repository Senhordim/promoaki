Rails.application.routes.draw do

  devise_for :stores, controllers: {
    sessions: 'stores/sessions',
    registrations: 'stores/registrations',
    confirmations: 'stores/confirmations',
    passwords: 'stores/passwords'
  }

  namespace :ad do
    get 'dashboard/index'
    root 'dashboard#index'
  end

  get 'home/index'
  root to: 'home#index'

end
