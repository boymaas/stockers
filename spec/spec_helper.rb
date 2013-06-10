$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'stockers'
require 'support/blueprints'

require 'database_cleaner'

RSpec.configure do |config|
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

# NOTE: doesn't work yet
def with_sql_log
  debugger
  old_logger = DataMapper.logger
  DataMapper.logger.set_log($stdout, :debug)
  r = yield
  DataMapper.logger = old_logger
  r
end

# Since DataMapper exceptions are not clear
# about what happened, that is the failure which
# occurred, we have this helper to extract this information.
#
# This is a bug in DataMapper
def _dm_e
  yield
rescue => e
  e.resource.save rescue nil
  raise "Error on datamapper action: #{e.resource.errors.to_hash}"
end
