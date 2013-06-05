require 'securerandom'

class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :parcel

  validates :user, uniqueness: { scope: :parcel }

  after_create :assign_token

  def assign_token
    self.confirmation_token = SecureRandom.urlsafe_base64
    save
  end
end
