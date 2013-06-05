require 'test_helper'

class SubscriptionTest < ActiveSupport::TestCase
  def setup
    @subscription = Fabricate(:subscription)
  end

  def test_assigns_token_on_creation
    refute_nil @subscription.confirmation_token  
  end
end
