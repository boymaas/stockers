require 'active_record'
require 'yaml'

require 'stockers/env'

module Stockers
  def self.setup_database_connection
    dbconfig = YAML::load(File.open('db/database.yml'))
    ActiveRecord::Base.establish_connection(dbconfig[Stockers.env])
    ActiveRecord::Base.logger = Logger.new(File.open('db/database.log', 'a'))
  end
end
