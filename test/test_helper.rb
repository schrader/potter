ENV["RAILS_ENV"] ||= "test"
require 'rails/test_help'
require File.expand_path('../../config/environment', __FILE__)

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  include FactoryGirl::Syntax::Methods

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

end

class ActionController::TestCase
  include Devise::TestHelpers
end

require "mocha/setup"