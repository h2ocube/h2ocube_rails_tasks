namespace :locales do
  desc 'Sort config/locales/*.yml'
  task :sort do
    def deeply_sort_hash(object)
      return object unless object.is_a?(Hash)
      hash = Hash.new
      object.each { |k, v| hash[k] = deeply_sort_hash(v) }
      sorted = hash.sort { |a, b| a[0].to_s <=> b[0].to_s }
      hash.class[sorted]
    end

    Dir[Rails.root.join('config/locales/*.yml')].each do |f|
      STDOUT.print (f).color(:green)
      hash = deeply_sort_hash(YAML.load(File.read(f)))
      File.open(f, 'w') { |file|
        file.write hash.to_yaml
      }
      STDOUT.print ("...done!\n").color(:green)
    end
  end
end
