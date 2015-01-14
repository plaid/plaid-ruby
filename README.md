# Plaid

Ruby bindings for the Plaid API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plaid'
```

And install

    $ bundle

Or install it system wide as:

    $ gem install plaid

## Usage

Please read the great documentation at http://plaid.com/docs/ for more information.

Configure the gem with your customer id, secret key, and the environment path you would like to use.

```ruby
Plaid.config do |p|
    p.customer_id = ['test_id']
    p.secret = ['test_secret']
    p.environment_location = ['https://tartan.plaid.com/']
   end
```

Authenticate a user to your desired level of api access (auth / connect). See wiki for complete about usage.

```ruby
    user = Plaid.auth('auth','plaid_test','plaid_good','wells')
    puts user.accounts
```

## Contributing

We highly encourage helping out with the gem. Either adding more tests, building new helper classes, fixing bugs,
or anything to increase overall quality.

The rules for contributing are simple:

1. No outside runtime libraries are allowed unless approved by the maintainer.
2. Follow the workflow set up below. Bug fixes should be labeled as a hot-fix, features labeled as features
3. Semantic versioning is strictly adhered to.
4. If you build a new feature you must release an update to the wiki / readme with information about the feature before it is accepted and commited.
5. New rubygems versions will be based on test coverage and passing tests, or time span for smaller combined bug fixes.

Contribution rules:

1. Fork it ( https://github.com/plaid/plaid-ruby/fork )
2a) Create your feature branch (`git checkout -b feature/my-new-feature`)
2b) Create your new hot-fix branch (`git checkout -b hot-fix/my-new-hotfix`)
3. Commit your changes
4. Push to the branch (`git push origin feature/my-new-feature`)
5. Create a new Pull Request
6. Wait for review
7. For more information please see Wiki for more in depth contribution rules.
