class SyncWorker
  include Sidekiq::Worker

  def perform(parcel_id)
    parcel = Parcel.find(parcel_id)
    parcel.sync
  end
end
