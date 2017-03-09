require 'bundler/gem_tasks'
require 'sdoc'
require 'rdoc/task'
require 'rake/testtask'
require 'fileutils'

RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = 'doc/rdoc'
  rdoc.generator = 'sdoc'
  rdoc.main = 'README.md'

  rdoc.rdoc_files.include('README.md', 'LICENSE', 'UPGRADING.md', 'lib/**/*.rb')
  rdoc.markup = 'tomdoc'
end

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
  t.ruby_opts << '-rminitest/pride'
end

desc 'Update the gh-pages branch with doc/rdoc contents'
task :update_gh_pages do
  tmpdir = Dir::Tmpname.create('plaid_docs') {}

  desc = `git describe`.chomp

  sh "git clone --shared . #{tmpdir}"

  Dir.chdir(tmpdir) do
    sh 'git checkout gh-pages'
    FileUtils.rm_rf Dir.glob("#{tmpdir}/*")
  end

  FileUtils.cp_r Dir.glob('doc/rdoc/*'), tmpdir

  Dir.chdir(tmpdir) do
    sh 'git add .'
    sh 'git add --update .'
    sh "git commit --allow-empty -m 'Regenerate docs for #{desc}'"
    sh 'git push'
  end

  FileUtils.rm_rf tmpdir
end

desc 'Generate rdoc and update gh-pages on GitHub'
task update_github_docs: %i(rdoc update_gh_pages) do
  sh 'git push origin gh-pages'
end

task default: :test
