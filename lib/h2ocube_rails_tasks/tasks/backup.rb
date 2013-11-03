desc 'Backup all things'
task :backup, [:to] do |task, args|
  Rake::Task['git:pull'].execute from: args[:to]
  Rake::Task['db:dump'].execute
  Rake::Task['git:push'].execute comment: "Backup @ #{Time.now}", to: args[:to]
end
