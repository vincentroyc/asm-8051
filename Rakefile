require 'rake'
require 'rspec/core/rake_task'

task default: :spec

desc 'Run specs'
RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = 'spec/*_spec.rb'
end
