# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

# Capybara
require 'capybara/rails'
require 'capybara/rspec'

# Spree Testing Support
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/factories' # this needs to be before requiring our own factories to allow overwriting
require 'spree/testing_support/preferences'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/url_helpers'
require 'spree/testing_support/caching'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
	# Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
	config.fixture_path = "#{::Rails.root}/spec/fixtures"

	# If you're not using ActiveRecord, or you'd prefer not to run each of your
	# examples within a transaction, remove the following line or assign false
	# instead of true.
	config.use_transactional_fixtures = true

	# URL helpers
	config.include Rails.application.routes.url_helpers
	config.include Spree::TestingSupport::UrlHelpers

	# FactoryGirl
	config.include FactoryGirl::Syntax::Methods

	config.include Spree::TestingSupport::Preferences
	config.include Spree::TestingSupport::UrlHelpers
	config.include Spree::TestingSupport::ControllerRequests

	config.infer_spec_type_from_file_location!
end
