require "bundler/gem_tasks"
require "rake/testtask"
require "dotenv/load"
require "fileutils"

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*.rb']
  t.verbose = true
  t.ruby_opts << "-rminitest/pride"
  t.warning = false
end
