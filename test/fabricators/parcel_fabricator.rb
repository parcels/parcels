Fabricator(:parcel) do
  barcode 'CJ494600188US'
end

Fabricator(:invalid_parcel, from: :parcel) do
  barcode 'sowhat'
end
