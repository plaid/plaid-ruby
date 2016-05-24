# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'plaid/version'

Gem::Specification.new do |spec|
  spec.name          = 'plaid'
  spec.version       = Plaid::VERSION
  spec.authors       = ['Oleg Dashevskii']
  spec.email         = ['olegdashevskii@gmail.com']

  spec.summary       = 'Ruby bindings for Plaid'
  spec.description   = 'Ruby gem wrapper for the Plaid API. Read more at the ' \
                       'homepage, the wiki, or in the Plaid documentation.'
  spec.homepage      = 'https://github.com/plaid/plaid-ruby'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test/|\.gitignore|\.travis)})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_dependency 'multi_json', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'sdoc', '~> 0.4.1'
  spec.add_development_dependency 'pry', '~> 0.10.3'
  spec.add_development_dependency 'webmock', '~> 2.0.0'
  spec.add_development_dependency 'minitest', '~> 5.8'
end
