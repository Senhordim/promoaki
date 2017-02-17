Rails.application.routes.draw do

  devise_for :stores

  namespace :ad do
    get 'dashboard/index'
    root 'dashboard#index'
  end

  get 'home/index'
  root to: 'home#index'

end
