desc 'Backup all things'
task :backup, [:to] => ['db:dump'] do |task, args|
  Rake::Task['git:push'].execute comment: "Backup @ #{Time.now}", to: args[:to]
end
