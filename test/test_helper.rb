ENV["RAILS_ENV"] ||= "test"
require 'rails/test_help'
require File.expand_path('../../config/environment', __FILE__)

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

end

require "mocha/setup"