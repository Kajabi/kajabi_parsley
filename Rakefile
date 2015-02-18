require "bundler/gem_tasks"

task default: :test

task test: ['test:helpers']

require 'rake/testtask'

task default: :test

task test: ['test:helpers']

namespace :test do
  Rake::TestTask.new(:helpers) do |t|
    t.pattern = "test/helpers/*test.rb"
  end
end
