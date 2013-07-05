require 'test_helper'

class ParcelTest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette(Fabricate.attributes_for(:parcel)[:barcode]) do
      @parcel = Fabricate(:parcel)
    end
  end

  def test_subscribes_to_parcel_updates
    email = Fabricate.attributes_for(:user)[:email]
    subscription = @parcel.subscribe(email)
    
    assert_equal subscription.user.email, email
    assert_equal subscription.parcel, @parcel
  end
end

class ParcelValidationTest < ActiveSupport::TestCase
  def test_validates_barcode
    refute Fabricate.build(:invalid_parcel).valid?
  end
end

class ParcelSyncTest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette(Fabricate.attributes_for(:parcel)[:barcode]) do
      @parcel = Fabricate(:parcel)
    end
  end

  def test_sync_adds_operations
    assert @parcel.operations.any?
  end

  def test_sync_adds_post_offices
    assert PostOffice.any?
  end

  def test_sync_adds_operation_types
    assert OperationType.any?
  end

  def test_sync_checks_for_delivery
    assert @parcel.delivered?
  end

  def test_sync_updates_parcel
    refute_nil @parcel.synced_at
  end
end
