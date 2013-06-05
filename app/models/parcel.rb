class Parcel < ActiveRecord::Base
  has_many :operations
  has_many :subscriptions
  has_many :users, through: :subscriptions

  def sync
    transaction do
      proxy.operations.each { |po| Operation.from_proxy(po, self) }

      self.delivered = true if self.operations.include?(OperationType.delivery)
      self.synced_at = DateTime.now
      save
    end
  end

  private

  def proxy
    @proxy ||= RussianPost::Parcel.new(self.barcode)
  end
end
