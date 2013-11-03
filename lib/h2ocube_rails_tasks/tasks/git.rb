if File.exists? Rails.root.join('.git')
  namespace :git do
    desc 'Git pull'
    task :pull, [:from] do |task, args|
      cmd = 'git pull'
      cmd << ' ' << args[:from] if args[:from]
      zfben_rails_rake_system cmd
    end

    desc 'Git commit with your comment'
    task :commit, [:comment] do |task, args|
      args = args.to_hash
      zfben_rails_rake_system 'git add .'
      comment = args.has_key?(:comment) ? args[:comment] : `git status`
      zfben_rails_rake_system "git commit -m '#{comment}' -a"
    end

    desc 'Git push with your comment'
    task :push, [:comment, :to] => [:commit] do |task, args|
      cmd = 'git push'
      cmd << ' ' << args[:to] if args[:to]
      zfben_rails_rake_system cmd
    end

    desc 'Clear files in .gitignore'
    task :clear do
      unless File.exists? Rails.root.join('.gitignore')
        zfben_rails_rake_err '.gitignore is not exists!'
      else
        zfben_rails_rake_system 'git clean -dfX'
      end
    end
  end
end
