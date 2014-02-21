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

Now create a YML file that has your CUSTOMER_ID and your SECRET provided by Plaid.io

There are two different requests one can make using the gem. Call and Customer. 
Call is anything that does not require an access_token(or a defined user).
Customer is anything that does require an access_token(or an already defined user).  

## Call Methods

1) add_account(type,username,password,email) \n
    Returns a hash with keys: code, access_token, accounts, transactions all with embedded json from Plaid.
```ruby
# if(code == 200) {returns {[:code => 'x'],[:access_token => 'y'],[:accounts => 'z'],[:transactions => 'a']}
# Note: 'x','y','z','a' are all formatted as json. 

Ex)
  new_account = Plaidio.call.add_account("amex","plaid_test","plaid_good","test@gmail.com") 
  puts new_account[:code]
  "200"
```
2) get_place(id) \n
     Returns a hash with keys: entity, location all with embedded json from Plaid. 
```ruby
# if(code == 200) {returns {[:entity => 'x'],[:location => 'y']}
# Note: 'x','y','z','a' are all formatted as json. 

Ex)
  location_deets = Plaidio.call.location("52a77fea4a2eab775f004109") 
  puts new_account[:location]["address"]
  "125 Main St"
```

## Requirements

* Ruby 2.0.0 or higher
