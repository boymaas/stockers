require 'yaml'
require 'logger'

require 'stockers/env'

module Stockers
  def self.setup_database_connection
    DataMapper.setup(:default, 'postgres://boymaas:@localhost/stockers_test')
  end
end
