Parcels::Application.routes.draw do
  get ':barcode' => 'parcels#show'
  post 'parcels' => 'parcels#create'
  root to: 'parcels#index'
end
