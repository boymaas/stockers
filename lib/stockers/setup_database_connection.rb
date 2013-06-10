require 'yaml'
require 'logger'

require 'stockers/env'

module Stockers
  def self.setup_database_connection
    DataMapper::Logger.new($stdout, :debug)
    DataMapper.setup(:default, 'postgres://boymaas:@localhost/stockers_test')

    # NOTE: some DataMapper settings, I want exceptions and another nameing convention
    DataMapper::Model.raise_on_save_failure = true
    DataMapper.repository(:default).adapter.resource_naming_convention =
        DataMapper::NamingConventions::Resource::UnderscoredAndPluralizedWithoutModule
  end
end
