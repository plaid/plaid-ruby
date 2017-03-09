# plaid-ruby [![Build Status](https://travis-ci.org/plaid/plaid-ruby.svg)](https://travis-ci.org/plaid/plaid-ruby) [![Gem Version](https://badge.fury.io/rb/plaid.svg)](http://badge.fury.io/rb/plaid)

The official Ruby bindings for the [Plaid API](https://plaid.com/docs).

This module was recently released as version `4.0.x` for Plaid's updated API. Use the gem `plaid-legacy` for version `3.0.x`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plaid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plaid

The gem supports Ruby 2.1+ only.

## Usage

This gem wraps the Plaid API, which is fully described in the [documentation](https://plaid.com/docs/api).

The RubyDoc for the gem is available [here](LINKPLACEHOLDER).

### Creating a Plaid client

Create an instance of the client using the `client_id`, `secret`, and `public_key` from your Plaid dashboard along with your environment of choice:

```ruby
require 'plaid'

$client = Plaid::Client.new(env: :sandbox,
                            client_id: '***',
                            secret: '***',
                            public_key: '***')

```

The `env` field is the environment which the client will be running in. Your choices for the `env` field include:
- `:sandbox` allows you to do your initial integrations tests against preloaded data without being billed or making expensive API calls. More information about using the API sandbox can be found on the [API Sandbox documentation](https://plaid.com/docs/api/blob/master/SANDBOX.md).
- `:development` allows you to test against both real and test accounts without being billed. More information about Plaid test accounts can be found in our [API documentation](https://plaid.com/docs/api/#sandbox).
- `:production` is the production environment where you can launch your production ready application and be charged for your Plaid usage.

### Creating a new item

A new item can be created by providing a set of credentials, an institution code, and a list of products to create the item with.

```ruby
item = client.item.create(credentials: { username: 'user_good',
                                         password: 'pass_good',
                                         pin: '1234' },
                          institution_id: 'ins_109509',
                          initial_products: %i(auth identity transactions))
```
The first argument for `client.item.create` is always the credentials in the form of a hash. 
```ruby
credentials = { username: 'user_good',
                password: 'pass_good',
                pin: '1234' }
```
The `pin` field in the credentials hash is not required and does not need to be entered if your institution does not require it.

A successful, non-MFA (multi-factor authentication) response (HTTP 200) to an item creation will come in the form of a hash where each of these attributes can be accessed by the corresponding string key:
```ruby
{ "access_token" => String,
  "item" => { "available_products" => [String],
              "billed_products"    => [String],
              "error"              => Object,
              "institution_id"     => String,
              "item_id"            => String,
              "webhook"            => nullable String },
  "request_id" => String }
```
The response provides three primary pieces of information:
- `access_token` is your token to access this item and the item's products in the future such as `auth` or `transactions`
- `item` provides information about the item such as the `item_id` and `available_products`
- `request_id` is the identifier for your actual request, this is often used to file tickets if necessary

There are other responses you can receive from an item creation such as an MFA response and an error response (they're all in hash form).

An MFA response (HTTP 210) looks like this:
```ruby
{ "access_token" => String,
  "device"       => nullable String,
  "device_list"  => nullable [Object],
  "mfa_type"     => String Enum (device, device_list, questions, selections),
  "questions"    => nullable [String],
  "request_id"   => String,
  "selections"   => nullable [Object] }
```

An example of how an MFA onboarding flow looks like can be seen below in the Examples section.

If an error occurs during the creation, an error will be thrown. The class for the error has values that you can access by using the following keys.
```ruby
{ "error_type"      => String,
  "error_code"      => String,
  "error_message"   => String,
  "display_message" => (nullable) String,
  "request_id"      => String }
```
Additional information on the meaning or usage of each field can be found in our [API Error documentation](https://plaid.com/docs/api#errors).

You can also add options such as `transactions.await_results` or `webhook` to your item creation, use keyed arguments:

```ruby
item = client.item.create(credentials: { username: 'user_good',
                                         password: 'pass_good' },
                          institution_id: 'ins_109509',
                          initial_products: %i(auth identity transactions),
                          transactions_await_results: true,
                          webhook: 'https://plaid.com/webhook-test')
```

More information about item creation options can be found in our [API documentation](https://plaid.com/docs/api#post-itemcreate).


## Examples

### Exchanging a Link public token for a Plaid access_token

If you have a [Link](https://github.com/plaid/link) `public token`, use this function to get an `access_token`: `client.item.public_token.exchange(public_token)`

An example of the function's usage if you have a `public_token` in hand:

```ruby
response = client.item.public_token.exchange(public_token)
access_token = response['access_token']
```

### Handle MFA during item creation

If MFA is requested by the financial institution, there will be additional steps required to finish the item creation flow:
```ruby
require 'plaid'

def answer_mfa(client, access_token, data)
  case data['mfa_type']
  when 'questions'
    answer_questions(client, access_token, data['questions'])
  when 'device_list'
    answer_device_list(client, access_token, data['device_list'])
  when 'selections'
    answer_selections(client, access_token, data['selections'])
  when 'device'
    answer_device(client, access_token, data['device'])
  else
    raise 'Unknown MFA type from Plaid'
  end
end

def answer_questions(client, access_token, _questions)
  # We have magically inferred the answer here, so we respond immediately.
  # In the real world, we would present the questions to our user and
  # submit their responses.
  answers = ['answer_0_0']
  client.item.mfa(access_token, 'questions', answers)
end

def answer_device_list(client, access_token, device_list)
  # We have picked the first device here.
  # In the real world, we would ask our user which device the passcode
  # should be sent to.
  device = device_list[0]['device_id']
  client.item.mfa(access_token, 'device_list', [device])
end

def answer_device(client, access_token, _device)
  # Another magically inferred answer.
  # In the real world, we would ask our user for the passcode they received.
  client.item.mfa(access_token, 'device', ['1234'])
end

def answer_selections(client, access_token, _selections)
  # We have magically inferred the answer here, so we respond immediately.
  # In the real world, we would present the selection question and choices
  # to our user and submit their responses.
  answers = %w(tomato ketchup)
  client.item.mfa(access_token, 'selections', answers)
end

begin
  client = Plaid::Client.new(env: :sandbox,
                             client_id: '***',
                             secret: '***',
                             public_key: '***')

  response = client.item.create(credentials: { username: 'user_good',
                                               password: 'mfa_device' },
                                institution_id: 'ins_109508',
                                initial_products: %i(transactions auth))

  access_token = response['access_token']
  response = answer_mfa(client, access_token, response) while response.key?('mfa_type')
rescue Plaid::PlaidError
  raise 'Error in main flow.'
end
```

### Deleting an item

```ruby
require 'plaid'

client = Plaid::Client.new(env: :sandbox,
                           client_id: '***',
                           secret: '***',
                           public_key: '***')

response = client.item.create(credentials: { username: 'user_good',
                                             password: 'pass_good' },
                              institution_id: 'ins_109509',
                              initial_products: %i(auth identity transactions))

access_token = response['access_token']

# Provide the access_token for the Item you want to delete
client.item.delete(access_token)
```

### Get paginated transactions
```ruby
require 'plaid'

client = Plaid::Client.new(env: :sandbox,
                           client_id: '***',
                           secret: '***',
                           public_key: '***')

item_response = client.item.create(credentials: { username: 'user_good',
                                                  password: 'pass_good' },
                                   institution_id: 'ins_109509',
                                   initial_products: %i(auth identity transactions))

access_token = item_response['access_token']

transaction_response = client.transactions.get(access_token, '2016-07-12', '2017-01-09')
transactions = transaction_response['transactions']

# the transactions in the response are paginated, so make multiple calls while
# increasing the offset to retrieve all transactions
while transactions.length < response['total_transactions']
  transaction_response = client.transactions.get(access_token,
                                                 '2016-07-12',
                                                 '2017-01-09',
                                                 offset: transactions.length)
  transactions += transaction_response['transactions']
end

```

### Obtaining user-related data

If you have an `access_token`, you can use following code to retreive data:
```ruby
require 'plaid'

client = Plaid::Client.new(env: :sandbox,
                           client_id: '***',
                           secret: '***',
                           public_key: '***')

item_response = client.item.create(credentials: { username: 'user_good',
                                                  password: 'pass_good' },
                                   institution_id: 'ins_109509',
                                   initial_products: %i(auth identity transactions))

access_token = item_response['access_token']

auth_response = client.auth.get(access_token)
auth = auth_response['auth']

```

### Create a Stripe bank_account_token

Exchange a Plaid Link `public_token` for an API `access_token` and a Stripe `bank_account_token`:
```ruby
require 'plaid'

client = Plaid::Client.new(env: :sandbox,
                           client_id: '***',
                           secret: '***',
                           public_key: '***')

exchange_token_response = client.item.public_token.exchange('[Plaid Link public_token]')
access_token = exchange_token_response['access_token']

stripe_response = client.processor.stripe.bank_account_token.create(access_token, '[Account ID]')
bank_account_token = stripe_response['stripe_bank_account_token']

```

There are also a number of other methods you can use to retrieve data:

* `client.accounts.get(access_code, ...)`: accounts
* `client.accounts.balance.get(access_code, ...)`: real-time balances
* `client.auth.get(access_code, ...)`: auth
* `client.identity.get(access_code, ...)`: identity
* `client.transactions.get(access_code, ...)`: transactions
* `client.credit_details.get(access_code, ...)`: credit details

All of these methods return appropriate data. More information and especially information about fields available in all the returned hashes can be found on the [API documentation](https://plaid.com/docs/api).

### Categories

You can request category information:

```ruby
categories = client.categories.get             # Array of all known categories
```

### Institutions

Financial institution information is available as shown below where the function arguments represent count and offset:

```ruby
institutions = client.institutions.get(count: 3, offset: 1)
```

## Errors

Any methods making API calls will result in an exception raised unless the response code is "200: Success" or
"210: MFA Required".

`Plaid::InvalidRequestError` is returned when the request is malformed and cannot be processed.

`Plaid::InvalidInputError` is returned when all fields are provided and are in the correct format, but the values provided are incorrect in some way.

`Plaid::RateLimitExceededError` returned when the request is valid but has exceeded established rate limits.

`Plaid::APIError` is returned during planned maintenance windows and in response to API internal server errors.

`Plaid::ItemError` indicates that information provided for the Item (such as credentials or MFA) may be invalid or that the Item is not supported on Plaid's platform.

Read more about response codes and their meaning in the
[Plaid documentation](https://plaid.com/docs/api).

## Network Timeout

A network timeout value is set in the `lib/plaid/connect.rb` file. It is currently defaulted at 600 (in seconds) which equates to about 10 minutes. Some requests from the Plaid API may take longer than others and we want to make sure that all valid requests have a chance to complete. Adjust this value if necessary.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/plaid/plaid-ruby. See also [contributing guidelines](CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
