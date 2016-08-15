# frozen_string_literal: true
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task default: [:spec, :rubocop]

RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/rules/*_spec.rb'
end

begin
  require 'rubocop/rake_task'
  desc 'Run Chefstyle (rubocop)'
  RuboCop::RakeTask.new do |task|
    task.options << '--display-cop-names'
  end
rescue LoadError
  puts 'rubocop gem is not available. `bundle install` to get rake rubocop to work'
end
