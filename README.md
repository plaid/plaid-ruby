# Plaidio

Ruby gem wrapper for Plaid.io API. 

## Installation

Plaidio is available through [Rubygems](http://rubygems.org/gems/plaidio) and can be installed via:

```
$ gem install plaidio
```

or add it to your Gemfile like this:

```
gem 'plaidio'
```

## Usage

```ruby
require 'plaidio'

# Plaidio global configuration
Pop this into your enviornment file.

Plaidio.config do |config|
  config.customer_id = keys[CUSTOMER_ID]
  config.secret = keys[SECRET]
end
```

Then create a YML file that has your CUSTOMER_ID and your SECRET provided by plaid.io

There are two different requests one can make to the platform. Call and Customer. 
Call is anything that does not require an access_token, or a defined customer. 
Customer is anything that does require an access_token. 

```ruby

Example) 
    new_account = Plaidio.call.add_account("amex","plaid_test","plaid_good","test@gmail.com") 
    # new_account[:code] = "200"

## Usage contd. 

## Requirements

* Ruby 2.0.0 or higher
