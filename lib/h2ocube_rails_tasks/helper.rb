require 'rainbow'
require 'fileutils'
require 'yaml'

def zfben_rails_rake_system cmd
  cmd = cmd
  STDOUT.print Rainbow(cmd + "\n").color(:green)
  zfben_rails_rake_err unless system cmd
end

def zfben_rails_rake_err msg = 'Failed!'
  STDERR.print Rainbow(msg + "\n").color(:red)
  exit!
end
