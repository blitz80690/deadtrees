require "rake"
require "yaml"
require "sequel"

env = ENV['RACK_ENV'] || 'development'
config = YAML.load_file('config/database.yml')[env]
DB = Sequel.connect(config)

namespace :migrate do
  Sequel.extension :migration

  desc "Perform automigration (reset your db data)"
  task :auto do
    Sequel::Migrator.run DB, 'migrations', :target => 0
    Sequel::Migrator.run DB, 'migrations'
    puts "<= migrate:auto executed"
  end

  desc "Perform migration up/down to VERSION"
  task :to, :version do |t, args|
    version = (args[:version] || ENV['VERSION']).to_s.strip
    raise "No VERSION was provided" if version.empty?
    Sequel::Migrator.apply DB, 'migrations', version.to_i
    puts "<= migrate:to[#{version}] executed"
  end

  desc "Perform migration up to latest migration available"
  task :up do
    Sequel::Migrator.run DB, "migrations"
    puts "<= migrate:up executed"
  end

  desc "Perform migration down (erase all data)"
  task :down do
    Sequel::Migrator.run DB, "migrations", :target => 0
    puts "<= migrate:down executed"
  end
end
