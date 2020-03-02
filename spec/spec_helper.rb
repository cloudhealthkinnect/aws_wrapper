require 'rspec'
require 'active_record'
require 'pry'

ActiveRecord::Base.establish_connection(adapter: 'postgresql', encoding: 'unicode', database: 'carelever_syncable')

ROOT_LIB  = File.join(Pathname(File.expand_path(File.join(File.dirname(__FILE__), '..'))), 'lib')
ROOT_SPEC = File.dirname(__FILE__)

load File.join(ROOT_SPEC, 'schema.rb')
Dir[File.join(ROOT_SPEC, 'support' ,'**', '*.rb')].each{|f| require f }
Dir[File.join(ROOT_LIB, '**', '*.rb')].each{|f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
