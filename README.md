# Plaid [![Build Status](https://travis-ci.org/plaid/plaid-ruby.svg?branch=version_2_first_release)](https://travis-ci.org/plaid/plaid-ruby)

Ruby bindings for the Plaid API

Warning: If you have been using any version < 1 please switch to the correct branch. 

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

Authenticate a user to your desired level of api access (auth / connect).

```ruby
user = Plaid.auth('auth','plaid_test','plaid_good','wells')
```

## Learn More

Learn about the full functionality of the library on our [Wiki](https://github.com/plaid/plaid-ruby/wiki)

## Contribute

We highly encourage helping out with the gem. Either adding more tests, building new helper classes, fixing bugs, or anything to increase overall quality.

Learn more about best practices, submitting a pull request, and rules for the build on our [Wiki](https://github.com/plaid/plaid-ruby/wiki/Contribute!)