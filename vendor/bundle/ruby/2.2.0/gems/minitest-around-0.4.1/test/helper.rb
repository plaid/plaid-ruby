if ENV['CODECLIMATE_REPO_TOKEN']
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

require 'bundler/setup'
require 'tempfile'
require 'minitest/autorun'
