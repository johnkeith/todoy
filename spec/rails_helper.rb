# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'database_cleaner'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|
  # If you're not using ActiveRecord, or you'd prefer not to run 
  # each of your examples within a transaction, remove the following 
  # line or assign false instead of true.
  config.use_transactional_fixtures = false

  # Clean up and initialize database before 
  # running test exmaples
  config.before(:suite) do
    # Truncate database to clean up garbage from 
    # interrupted or badly written examples
    DatabaseCleaner.clean_with(:truncation)

    # Seed dataase. Use it only for essential
    # to run application data.
    load "#{Rails.root}/db/seeds.rb"
  end

  config.around(:each) do |example|
    # Use really fast transaction strategy for all 
    # examples except `js: true` capybara specs
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction

    # Start transaction
    DatabaseCleaner.start

    # Run example
    example.run

    # Rollback transaction
    DatabaseCleaner.clean

    # Clear session data
    Capybara.reset_sessions!
  end
end
