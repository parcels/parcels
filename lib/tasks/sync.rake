namespace :parcels do
  desc 'Sync parcels with Postal Services'
  task :sync => :environment do
    Parcel.outdated.each { |p| p.queue_sync }
  end
end
