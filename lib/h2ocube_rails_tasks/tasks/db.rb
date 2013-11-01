namespace :db do
  desc 'Dump database'
  task :dump do
    list = Rake::Task.tasks.map(&:name)
    %w(mysql:dump postgresql:dump mongodb:dump).each do |name|
      Rake::Task[name].execute if list.include?(name)
    end
  end
end
