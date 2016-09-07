ENV["RAILS_ENV"] ||= 'test'

require_relative "../config/environment"

require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require 'rails-controller-testing'
require 'shoulda/matchers'

Dir[App::Engine.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.disable_monkey_patching!
  config.warnings = false
  config.profile_examples = nil
  config.order = :random
  Kernel.srand config.seed
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
