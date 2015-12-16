# Plaid [![Build Status](https://travis-ci.org/plaid/plaid-ruby.svg?branch=release_v_1.0.0)](https://travis-ci.org/plaid/plaid-ruby) [![Gem Version](https://badge.fury.io/rb/plaid.svg)](http://badge.fury.io/rb/plaid)

Ruby bindings for the Plaid API

## Notes

This version is a beta version that contains failing tests for the new 'info' endpoint. While these have been tested individually on real accounts the tests here will fail with the test accounts supplied. These will be updated soon with test credentials.

Latest stable version: **1.7.1**

This version removes the need to use 'type' in each additional call.

**Warning: If you have been using any version < 1 please switch to the correct branch (V0.1.6). Installing without specifying a version from RubyGems results in V1.1 build. **

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

### Configuring Plaid
Configure the gem with your customer id, secret key, and the environment path you would like to use.

```ruby
Plaid.config do |p|
  p.customer_id = 'Plaid provided customer ID here'
  p.secret = 'Plaid provided secret key here'
  p.environment_location = 'URL for the development or production environment'
  # i.e. 'https://tartan.plaid.com/' for development, or
  # 'https://api.plaid.com/' for production
end
```

### Creating a new Plaid User
Authenticate a user to your desired level of api access (auth / connect).

```ruby
user = Plaid.add_user('auth', 'plaid_test', 'plaid_good', 'wells')
```

If the authentication requires a pin, you can pass it in as the fifth argument:

```ruby
user = Plaid.add_user('auth', 'plaid_test', 'plaid_good', 'usaa', '1234')
```

To add options such as `login_only` or `webhooks`, use the sixth argument:

```ruby
user = Plaid.add_user('auth', 'plaid_test', 'plaid_good', 'wells', nil, { login_only: true, webhooks: 'https://example.org/callbacks/plaid')
```

### Restoring a Plaid User using an access token

```ruby
user = Plaid.set_user('access_token')
```

```ruby
user = Plaid.set_user('access_token', ['connect'])
```

### Exchanging a Link public_token for a Plaid access_token

```ruby
Plaid.config do |p|
  p.customer_id = 'test_id'
  p.secret = 'test_secret'
  p.environment_location = 'https://tartan.plaid.com'
end

# Exchange a Link public_token for a Plaid access_token
exchangeTokenResponse = Plaid.exchange_token('test,chase,connected')
# Optionally include an account_id
exchangeTokenResponse = Plaid.exchange_token('test,chase,connected', 'account_id')

# Use the API access_token to initialize a user
# Note: This example assumes you are using Link with the "auth" product
user = Plaid.set_user(exchangeTokenResponse.access_token, ['auth'])

# Retrieve the user's accounts
user.get('auth')

# Print the name of each account
user.accounts.each { |account| print account.meta['name'] + "\n"}
```

## Semantic Versioning

Methods marked with `API: public` are officially supported by the gem maintainers. Since
we are using semantic versioning (http://semver.org/spec/v2.0.0.html), the maintainers are
committed to backwards-compatibility support for these API calls when we update the Minor
version. So for example, going from version 1.4.x to 1.5.x will not change these public
API calls.

However, we may change these method signatures or even the gem architecture when updating
the Major number. For example, we have some breaking changes in mind with version 2.0

Methods marked with `API: semi-private` are used internally for consistency. While it is
possible to monkey-patch against them for your own use, the maintainers make no guarantees
on backwards compatibility.

## Learn More

Learn about the full functionality of the library on our [Wiki](https://github.com/plaid/plaid-ruby/wiki)

## Contribute

We highly encourage helping out with the gem. Either adding more tests, building new helper classes, fixing bugs, or anything to increase overall quality.

Learn more about best practices, submitting a pull request, and rules for the build on our [Wiki](https://github.com/plaid/plaid-ruby/wiki/Contribute!)
