require 'bundler/setup'
require 'bundler/gem_tasks'
require 'cucumber/rake/task'

desc 'Default: run unit tests.'
task :default => [:test, :"test:isolated", :features]

# Test
TEST_FILES = FileList.new('test/*_{test,spec}.rb')

desc "Run all tests"
task :test do
  TEST_FILES.each do |test_file|
    sh "bundle", "exec", "rake", "test:isolated", "TEST=#{test_file}"
  end
end

require 'rake/testtask'
Rake::TestTask.new(:"test:isolated") do |test|
  test.test_files = TEST_FILES
  test.libs << 'test'
  test.verbose = true
  test.warning = true
end

# Examples
EXAMPLES = FileList["examples/*.rb"]
desc "Run all examples"
task :"test:examples" do
  EXAMPLES.each do |example|
    sh "bundle", "exec", "ruby", example
  end
end

# Features
Cucumber::Rake::Task.new(:features) do |t|
  skip_tags = %w[rspec todo].map { |tag| "--tag ~@#{tag}" }.join(" ")
  t.cucumber_opts = "features #{skip_tags}"
end

# RDoc
require 'rdoc/task'
RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'mintest-around'
  rdoc.main     = 'README.md'
  rdoc.rdoc_files.include('README.md', 'LICENSE', 'lib/**/*.rb')
  rdoc.options << "--all"
  rdoc.options << "--markup markdown"
end
