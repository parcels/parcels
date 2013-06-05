Parcels::Application.routes.draw do
  get '/parcels' => 'parcels#index', as: 'parcels'
  get '/:id' => 'parcels#show', as: 'parcel'
  post '/parcels' => 'parcels#create'
  root to: 'parcels#index'
end
