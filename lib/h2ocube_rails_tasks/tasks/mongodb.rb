if File.exist? Rails.root.join('config/mongoid.yml')
  namespace :mongodb do
    config = YAML.load(File.read(Rails.root.join('config/mongoid.yml')))[Rails.env.to_s]['sessions']['default']
    db = config['database']
    host = config['hosts'][0].split(':')[0]
    port = config['hosts'][0].split(':')[1]

    backup = "mongodump --host #{host} --port #{port} --db #{db}"
    desc backup
    task :dump do
      zfben_rails_rake_system backup
    end

    restore = "mongorestore --host #{host} --port #{port} --drop"
    desc restore
    task :restore do
      zfben_rails_rake_system restore
    end

    repair = "mongod --nohttpinterface --nojournal --port #{port} --bind_ip #{host} --dbpath #{Rails.root}/mongo --repair"
    desc repair
    task :repair do
      zfben_rails_rake_system repair
    end
  end
end
