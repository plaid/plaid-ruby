# -*- encoding: utf-8 -*-

=begin
#The Plaid API

#The Plaid REST API. Please see https://plaid.com/docs/api for more details.

The version of the OpenAPI document: 2020-09-14_1.562.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 6.3.0

=end

$:.push File.expand_path("../lib", __FILE__)
require "plaid/version"

Gem::Specification.new do |s|
  s.name        = "plaid"
  s.version     = Plaid::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Plaid"]
  s.email       = [""]
  s.homepage    = "https://plaid.com"
  s.summary     = "The Plaid API Ruby Gem"
  s.description = "Ruby gem wrapper for the Plaid API. Read more at the homepage, the wiki, or in the Plaid documentation."
  s.license     = "MIT"
  s.required_ruby_version = ">= 3.0.0"

  s.add_runtime_dependency 'faraday', '>= 1.0.1', '< 3.0'
  s.add_runtime_dependency 'faraday-multipart', '>= 1.0.1', '< 2.0'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'
  s.add_development_dependency 'bundler', '~> 2.2.9'
  s.add_development_dependency 'dotenv'
  s.add_development_dependency 'minitest', '~> 5.14'
  s.add_development_dependency 'minitest-around', '~> 0.5.0'
  s.add_development_dependency 'rake', '>= 13.0'
  s.add_development_dependency 'rubocop', '~> 0.91.0'

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
