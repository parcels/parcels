require 'sidekiq/web'

Parcels::Application.routes.draw do
  resources :parcels, only: [:show, :create]
  get '/parcels/', to: redirect('/')
  root to: 'parcels#index'
end
