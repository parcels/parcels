require 'sidekiq/web'

Parcels::Application.routes.draw do
  resources :parcels, only: [:show, :create]

  root to: 'parcels#index'
end
