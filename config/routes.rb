Rails.application.routes.draw do

  devise_for :stores, controllers: {
    sessions: 'stores/sessions',
    registrations: 'stores/registrations',
  }

  namespace :ad do
    get 'dashboard/index'
    root 'dashboard#index'
  end

  get 'home/index'
  root to: 'home#index'

end
