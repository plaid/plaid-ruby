Gem::Specification.new do |s|
  s.name        = 'plaidio'
  s.version     = '0.0.2'
  s.date        = '2014-02-19'
  s.summary     = "Plaid.io api gem"
  s.description = "A simple to use ruby wrapper for Plaid.io API."
  s.authors     = ["Justin Crites", "Gamble McAdam"]
  s.email       = 'justin@guavatext.com'
  s.files       = ["lib/plaidio.rb", "lib/plaidio/config.rb","lib/plaidio/call.rb","lib/plaidio/customer.rb"]
  s.homepage    =
    'https://github.com/j4ustin/plaidio'
  s.license       = 'MIT'
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rest-client"
  s.add_development_dependency "json"
end