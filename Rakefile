require "bundler/gem_tasks"

require 'stockers'
require 'active_record'
require 'logger'

task :default => :migrate

task :migrate => :environment do
  ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
end

task :environment do
  Stockers.setup_database_connection
end
