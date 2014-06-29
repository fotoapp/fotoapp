ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails/capybara"
require "rack_session_access/capybara"

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("test/support/**/*.rb")].each {|f| require f}

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :photo_stores, :photos, :users

  include FixturesHelper
end

class ActionController::TestCase
  include Capybara::DSL
  include AuthenticationHelper
end

# Put Fog in mock mode.
Fog.mock!

# Public: Bootstrap fog mock with photo store folder (bucket).
#
# photo_store - PhotoStore object.
#
# Returns a PhotoStore.
def bootstrap_fog_mock(photo_store)
  photo_store.connection.directories.create(:key => photo_store.folder_name)
  photo_store
end
