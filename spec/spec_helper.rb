ENV["RACK_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)

require "rubygems"
require "database_cleaner"

RSpec.configure do |config|
  config.order = "random"

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end