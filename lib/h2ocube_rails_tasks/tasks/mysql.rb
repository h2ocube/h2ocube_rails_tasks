if File.exist? Rails.root.join('config/database.yml')
  namespace :mongodb do
    config = YAML.load(File.read(Rails.root.join('config/database.yml')))[Rails.env.to_s]['sessions']['default']
    db = config['database']
    host = config['host']
    FileUttils.mkdir_p Rails.root.join('mysql')

    backup = "mysqldump -h #{host} #{db} > #{Rails.root}/mysql/dump.sql"
    desc backup
    task :dump do
      zfben_rails_rake_system backup
    end

    restore = "mysql -h #{host} #{db} < #{Rails.root}/mysql/dump.sql"
    desc restore
    task :restore do
      zfben_rails_rake_system restore
    end
  end
end
