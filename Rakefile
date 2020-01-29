require "bundler/gem_tasks"
task :default => :spec

require'./config/environment'

def reload!
  load_all './lib'
end

task :console do
  Pry.start
end
