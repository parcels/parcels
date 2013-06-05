require 'test_helper'

class ParcelTest < ActiveSupport::TestCase
  def setup
    @parcel = Fabricate(:parcel)
  end

  def test_subscribes_to_parcel_updates
    email = Fabricate.attributes_for(:user)[:email]
    subscription = @parcel.subscribe(email)
    
    assert_equal subscription.user.email, email
    assert_equal subscription.parcel, @parcel
  end
end
