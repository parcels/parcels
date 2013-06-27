require 'securerandom'

class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :parcel

  validates :user, uniqueness: { scope: :parcel }

  scope :pending_notifications, -> {
    joins(parcel: :operations)
      .where('notified_at IS NULL OR notified_at < operations.created_at')
      .distinct
  }

  before_create :assign_token

  def assign_token
    self.token = SecureRandom.urlsafe_base64
  end

  def confirm
    self.confirmed = true
    save
  end
end
