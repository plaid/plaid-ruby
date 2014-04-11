Gem::Specification.new do |s|
  s.name        = 'plaid'
  s.version     = '0.1.4'
  s.date        = '2014-04-11'
  s.summary     = "Plaid.io api gem"
  s.description = "A simple to use ruby wrapper for Plaid.io API."
  s.authors     = ["Justin Crites", "Gamble McAdam", "Rahul Ramakrishnan"]
  s.email       = 'justin@guavatext.com'
  s.files       = ["lib/plaid.rb", "lib/plaid/config.rb","lib/plaid/call.rb","lib/plaid/customer.rb"]
  s.homepage    =
    'https://github.com/j4ustin/plaid'
  s.license       = 'MIT'
  s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency "json"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
