if File.exist? Rails.root.join('config/database.yml')
  namespace :postgresql do
    config = YAML.load(File.read(Rails.root.join('config/database.yml')))[Rails.env.to_s]
    if config['adapter'] == 'postgresql'
      db = config['database']
      host = config['host']
      user = config['username']
      password = config['password']
      FileUtils.mkdir_p Rails.root.join('postgresql')

      backup = "pg_dump -h #{host} -d #{db} -U #{user} -f #{Rails.root}/postgresql/dump.sql"
      desc backup
      task :dump do
        zfben_rails_rake_system backup
      end

      restore = "postgresql -h #{host} #{db} < #{Rails.root}/postgresql/dump.sql"
      desc restore
      task :restore => 'db:create' do
        zfben_rails_rake_system restore
      end

      backup_all = "pg_dump -h #{host} --all-databases > #{Rails.root}/postgresql/dump_all.sql"
      desc backup_all
      task :dump_all do
        zfben_rails_rake_system backup_all
      end

      restore_all = "postgresql -h #{host} < #{Rails.root}/postgresql/dump_all.sql"
      desc restore_all
      task :restore_all => 'db:create' do
        zfben_rails_rake_system restore_all
      end
    end
  end
end
