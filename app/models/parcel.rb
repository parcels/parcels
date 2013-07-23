class Parcel < ActiveRecord::Base
  has_many :operations, dependent: :destroy
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :barcode, uniqueness: true
  validate :must_have_a_valid_barcode

  scope :outdated, -> { where('synced_at < ?', 1.hour.ago) }

  def sync
    transaction do
      proxy.operations.each { |po| Operation.from_proxy(po, self) }

      self.delivered = true if operations.where(operation_type: OperationType.delivery).any?
      self.synced_at = DateTime.now
      save
    end

    self
  end

  def autosync
    sync if (synced_at.nil? || synced_at < 1.hour.ago) && !delivered?
    self
  end

  def subscribe(email)
    Subscription.create(user: User.find_or_create_by(email: email), parcel: self)
  end

  def to_param
    barcode
  end

  def delivered?
    delivered
  end

  def queue_sync
    SyncWorker.perform_async(id)
  end

  def country
    Iso3166Ru.find_by(alpha2: barcode[-2..-1]) ||
      operations.first.try(:post_office).try(:country)
  end

  def time_in_transit
    if delivered?
      operations.where(operation_type: OperationType.delivery).first.happened_at - operations.first.happened_at
    else
      Time.now - operations.first.happened_at
    end
  end

  private

  def proxy
    @proxy ||= RussianPost::Parcel.new(self.barcode)
  end

  def must_have_a_valid_barcode
    if !RussianPost::Barcode.new(barcode).valid?
      errors.add(:barcode, "введен неверно")
    end
  end
end
