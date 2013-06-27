class Parcel < ActiveRecord::Base
  has_many :operations
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :barcode, uniqueness: true

  scope :outdated, -> { where('synced_at < ?', 1.hour.ago) }

  after_create :sync

  def to_param
    barcode
  end

  def delivered?
    delivered
  end

  def queue_sync
    SyncWorker.perform_async(id)
  end

  def sync
    transaction do
      proxy.operations.each { |po| Operation.from_proxy(po, self) }

      self.delivered = true if operations.where(operation_type: OperationType.delivery).any?
      self.synced_at = DateTime.now
      save
    end

    subscriptions.each do |s|
      if operations.first.created_at > s.notified_at
        SubscriptionMailer.delay.notification(s.id)
      end
    end
  end

  def subscribe(email)
    Subscription.create(user: User.find_or_create_by(email: email), parcel: self)
  end

  private

  def proxy
    @proxy ||= RussianPost::Parcel.new(self.barcode)
  end
end
