if File.exists? Rails.root.join('config/rainbows.rb')
  namespace :rainbows do
    desc 'Start rainbows server'
    task :start => :stop do
      cmd 'rainbows -c config/rainbows.rb -E production -D'
      zfben_rails_rake_system 'mkdir tmp' unless File.exists? Rails.root.join('tmp')
      zfben_rails_rake_system cmd
    end

    desc 'Stop rainbows server'
    task :stop do
      if File.exists? Rails.root.join('tmp/rainbows.pid')
        zfben_rails_rake_system 'kill -QUIT `cat tmp/rainbows.pid`'
        sleep 1
        zfben_rails_rake_system 'rm tmp/rainbows.pid' if File.exists? Rails.root.join('tmp/rainbows.pid')
      end
    end

    desc 'Hot restart rainbows server'
    task :restart do
      if File.exists? Rails.root.join('tmp/rainbows.pid')
        zfben_rails_rake_system 'kill -USR2 `cat tmp/rainbows.pid`'
      end
    end
  end
end
