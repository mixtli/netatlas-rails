namespace :db do
  desc 'Populate db with sample data'
  task :truncate => :environment do
    conn = ActiveRecord::Base.connection
    tables = conn.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'").map { |r| r['table_name'] }
    tables.delete "schema_migrations"
    tables.each { |t| conn.execute("TRUNCATE #{t}") }
  end

  # TODO:  Implement force drop database
  desc 'Force drop database'
  task :force_drop do
    raise "not yet implemented"
    # We want to do something like the following as db superuser
    #select pg_terminate_backend(procpid) from pg_stat_activity where datname='YourDatabase'
  end
end
