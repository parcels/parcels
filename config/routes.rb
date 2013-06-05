Parcels::Application.routes.draw do
  get ':barcode' => 'parcels#show', as: :parcel
  post 'parcels' => 'parcels#create'
  root to: 'parcels#index'
end
