Gem::Specification.new do |s|
  s.name        = 'plaid'
  s.version     = '0.1.6'
  s.date        = '2014-10-3'
  s.summary     = 'Plaid Ruby Gem'
  s.description = 'Ruby Gem wrapper for Plaid API.'
  s.authors     = ['Justin Crites', 'Gamble McAdam', 'Rahul Ramakrishnan']
  s.email       = 'justin@guavatext.com'
  s.files       = ['lib/plaid.rb', 'lib/plaid/config.rb','lib/plaid/call.rb','lib/plaid/customer.rb']
  s.homepage    = 'https://github.com/plaid/plaid-ruby'
  s.license     = 'MIT'
  s.add_runtime_dependency 'rest-client'
  s.add_runtime_dependency 'json'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
end
