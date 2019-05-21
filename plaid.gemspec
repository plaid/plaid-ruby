lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'plaid/version'

Gem::Specification.new do |spec| # rubocop:disable Metrics/BlockLength
  spec.name          = 'plaid'
  spec.version       = Plaid::VERSION
  spec.authors       = ['Edmund Loo']
  spec.email         = ['eloo@plaid.com']

  spec.summary       = 'Ruby bindings for Plaid'
  spec.description   = 'Ruby gem wrapper for the Plaid API. Read more at the ' \
                       'homepage, the wiki, or in the Plaid documentation.'
  spec.homepage      = 'https://plaid.com/'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host' to allow pushing to a single host or delete this
  # section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test/|\.gitignore|\.travis)})
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1.0'

  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'hashie', '>= 3.4.3'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'minitest', '~> 5.10'
  spec.add_development_dependency 'minitest-around', '~> 0.4.0'
  spec.add_development_dependency 'rake', '>= 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.53.0'
  spec.add_development_dependency 'sdoc', '~> 1.0.0'
  spec.add_development_dependency 'vcr', '~> 4.0.0'
end
