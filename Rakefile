require "bundler/gem_tasks"

require 'stockers/env'
require 'active_record'
require 'logger'

task :default => :migrate

task :migrate => :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end

task :environment do
  config = YAML::load(File.open('db/database.yml'))
  ActiveRecord::Base.establish_connection(config[Stockers.env])
  ActiveRecord::Base.logger = Logger.new(File.open('db/database.log', 'a'))
end
