if File.exists? Rails.root.join('config/puma.rb')
  namespace :puma do
    desc 'Start puma server'
    task :start => :stop do
      cmd = 'puma -C config/puma.rb -e production'
      zfben_rails_rake_system 'mkdir tmp' unless File.exists? Rails.root.join('tmp')
      zfben_rails_rake_system cmd
    end

    desc 'Stop puma server'
    task :stop do
      if File.exists? Rails.root.join('tmp/puma.pid')
        zfben_rails_rake_system 'kill -QUIT `cat tmp/puma.pid`'
        sleep 1
        zfben_rails_rake_system 'rm tmp/puma.pid' if File.exists? Rails.root.join('tmp/puma.pid')
      end
    end

    desc 'Hot restart puma server'
    task :restart do
      if File.exists? Rails.root.join('tmp/puma.pid')
        zfben_rails_rake_system 'kill -USR2 `cat tmp/puma.pid`'
      end
    end
  end
end