namespace :db do
  desc 'Dump all database'
  task :dump do
    list = Rake::Task.tasks.map(&:name)
    %w(mysql:dump postgresql:dump mongodb:dump).each do |name|
      Rake::Task[name].execute if list.include?(name)
    end
  end

  desc 'Restore all database'
  task :restore do
    list = Rake::Task.tasks.map(&:name)
    %w(mysql:restore postgresql:restore mongodb:restore).each do |name|
      Rake::Task[name].execute if list.include?(name)
    end
  end
end
