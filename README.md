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

Then create a YML file that has your CUSTOMER_ID and your SECRET provided by plaid.io

## Requirements

* Ruby 2.0.0 or higher
