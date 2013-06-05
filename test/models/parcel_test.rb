require 'test_helper'

class ParcelTest < ActiveSupport::TestCase
  def setup
    @parcel = Fabricate(:parcel)
  end

  def test_syncs
    assert_equal @parcel.operations.count, 0
    assert_equal PostOffice.count, 0
    assert_equal OperationType.count, 0

    VCR.use_cassette(@parcel.barcode) { @parcel.sync }

    assert_operator @parcel.operations.count, :>, 0
    assert_operator PostOffice.count, :>, 0
    assert_operator OperationType.count, :>, 0

    assert_operator @parcel.synced_at, :>, DateTime.now - 5
  end

  def test_subscribes_to_parcel_updates
    email = Fabricate.attributes_for(:user)[:email]
    subscription = @parcel.subscribe(email)
    
    assert_equal subscription.user.email, email
    assert_equal subscription.parcel, @parcel
  end
end
