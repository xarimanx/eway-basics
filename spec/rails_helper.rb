# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/webkit'
require 'capybara-screenshot'
require 'factory_girl_rails'
require 'site_prism'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

Capybara.javascript_driver = :webkit
Capybara::Webkit.configure do |config|
  config.allow_url("https://secure.ewaypayments.com/scripts/eCrypt.js")
  config.allow_url("https://secure-au.sandbox.ewaypayments.com/sharedpage/assets/eway-1-1/css/eway-paynow.css")
  config.allow_url("secure.ewaypayments.com")
  config.allow_url("secure-au.sandbox.ewaypayments.com")
end

RSpec.configure do |config|
  config.before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end
  config.include FactoryGirl::Syntax::Methods
end
