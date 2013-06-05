ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "vcr"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures/vcr_cassettes'
  c.hook_into :webmock # or :fakeweb
  # c.allow_http_connections_when_no_cassette = true
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
