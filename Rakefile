require 'bundler/gem_tasks'
require 'sdoc'
require 'rdoc/task'
require 'rake/testtask'

RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = 'doc/rdoc'
  rdoc.generator = 'sdoc'
  rdoc.main = 'README.md'

  rdoc.rdoc_files.include('README.md', 'LICENSE', 'UPGRADING.md',
                          'CONTRIBUTING.md', 'CHANGELOG.md', 'lib/**/*.rb')
  rdoc.markup = 'tomdoc'
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
  t.ruby_opts << '-rminitest/pride'
end

task default: :test
