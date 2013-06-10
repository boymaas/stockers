require "bundler/gem_tasks"

require 'stockers'
require 'logger'

task :default => :migrate

task :migrate => :environment do
  # DataMapper.auto_upgrade!
  DataMapper.auto_migrate! # WARN: this will drop all tables!!
end

task :environment do
  Stockers.setup_database_connection
end
