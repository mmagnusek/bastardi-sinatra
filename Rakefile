namespace :db do
  task :load_config do
    require 'active_record'
    ActiveRecord::Base.establish_connection(
      :adapter => 'sqlite3',
      :database =>  'bastardi.sqlite3.db'
    )
  end
  
  desc "Migrate the database"
  task(:migrate => :load_config ) do
    # ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate("db/migrate")
  end
end