require 'sidekiq/web'

Parcels::Application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  
  get '/parcels' => 'parcels#index', as: 'parcels'
  get '/:id' => 'parcels#show', as: 'parcel'
  post '/parcels' => 'parcels#create'

  post '/:barcode/subscriptions' => 'subscriptions#create', as: 'parcel_subscriptions'
  get '/subscriptions/:token/confirm' => 'subscriptions#confirm', as: 'subscription_confirm'
  get '/subscriptions/:token/cancel' => 'subscriptions#destroy', as: 'subscription_cancel'

  root to: 'parcels#index'
end
