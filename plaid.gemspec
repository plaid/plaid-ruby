lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'plaid/version'

Gem::Specification.new do |spec|
  spec.name          = 'plaid'
  spec.version       = Plaid::VERSION
  spec.authors       = ['Justin Crites']
  spec.email         = ['crites.justin@gmail.com']
  spec.summary       = 'Ruby bindings for Plaid'
  spec.description   = 'Ruby gem wrapper for the Plaid API. Read more at the homepage, the wiki, or the plaid documentation.'
  spec.homepage      = 'https://github.com/plaid/plaid-ruby'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~>3.1'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-stack_explorer'
  spec.add_development_dependency 'webmock'
end

