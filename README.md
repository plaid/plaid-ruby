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
Plaidio.config do |config|
  config.customer_id = 'your customer id'
  config.secret = 'your secret code'
end

Add this into a YML file called keys.yml, and add it to your .gitignore.

## Requirements

* Ruby 2.0.0 or higher
