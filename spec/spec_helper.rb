require 'capybara/rspec'
require 'support/request_helpers'
require 'sidekiq/testing'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    Sidekiq::Testing.fake!
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
    Sidekiq::Worker.clear_all
    allow_any_instance_of(MicroverseClient).to receive(:get_users).with(
      {:limit=>20, :offset=>0}
    ).and_return([{
      "id": 1,
      "first_name": "Merlin",
      "last_name": "Sawayn",
      "status": "Active",
      "created_at": "2020-09-30T20:12:46.769Z",
      "email": "juliusjohns@mcclure.net"
    }].as_json)
    allow_any_instance_of(MicroverseClient).to receive(:get_users).with(
      {:limit=>20, :offset=>20}
    ).and_return([].as_json)
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include Requests::JsonHelpers, :type => :request
end
