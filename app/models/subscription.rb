require 'securerandom'

class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :parcel

  validates :user, uniqueness: { scope: :parcel }

  before_create :assign_token

  def assign_token
    self.token = SecureRandom.urlsafe_base64
  end
end
