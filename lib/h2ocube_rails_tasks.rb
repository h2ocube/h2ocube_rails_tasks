module ZfbenRailsRake
  class Railtie < Rails::Railtie
    railtie_name :h2ocube_rails_tasks
    rake_tasks do
      path = File.dirname(__FILE__) << '/h2ocube_rails_tasks'
      require path + '/helper.rb'
      Dir[path + '/tasks/*.rb'].each{ |f| require f }
    end
  end
end
