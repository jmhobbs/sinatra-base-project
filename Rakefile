namespace :db do
  desc "Run migrations"
  task :migrate, [:version] do |_, args|
    require "sequel"
    Sequel.extension :migration
    db = Sequel.connect(ENV["DATABASE_URL"])
    if args[:version]
      puts "Migrating to version #{args[:version]}"
      Sequel::Migrator.run(db, "db/migrate", target: args[:version].to_i)
    else
      puts "Migrating to latest"
      Sequel::Migrator.run(db, "db/migrate")
    end
  end
end

task default: :test
task :test do
  Dir.glob("./test/models/*.rb").each { |file| require file }
end
