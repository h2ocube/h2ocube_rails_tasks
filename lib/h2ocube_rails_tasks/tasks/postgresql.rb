if File.exist? Rails.root.join('config/database.yml')
  namespace :postgresql do
    config = YAML.load(File.read(Rails.root.join('config/database.yml')))[Rails.env.to_s]
    if config['adapter'] == 'postgresql'
      db = config['database']
      host = config['host']
      user = config['username']
      FileUtils.mkdir_p Rails.root.join('postgresql')

      backup = "pg_dump -h #{host} -d #{db} -U #{user} -F t -f #{Rails.root}/postgresql/dump.tar"
      desc backup
      task :dump do
        zfben_rails_rake_system backup
      end

      restore = "pg_restore -h #{host} -U #{user} -d #{user} -c -O -n public #{Rails.root}/postgresql/dump.tar"
      desc restore
      task :restore do
        zfben_rails_rake_system restore
      end
    end
  end
end
