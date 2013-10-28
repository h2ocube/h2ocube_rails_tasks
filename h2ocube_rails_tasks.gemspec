# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'h2ocube_rails_tasks'
  s.version     = '0.0.9'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Ben']
  s.email       = ['ben@h2ocube.com']
  s.homepage    = 'https://github.com/h2ocube/h2ocube_rails_tasks'
  s.summary     = %q{This is a plugin to add some useful tasks to rails.}
  s.description = %q{This is a plugin to add some useful tasks to rails.}
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'rainbow'
end
