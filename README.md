# plaid-ruby [![Circle CI](https://circleci.com/gh/plaid/plaid-ruby.svg?style=svg&circle-token=30ee002ac2021da5b5b5a701d45fe2888af124a5)](https://circleci.com/gh/plaid/plaid-ruby) [![Gem Version](https://badge.fury.io/rb/plaid.svg)](http://badge.fury.io/rb/plaid)

The official Ruby bindings for the [Plaid API](https://plaid.com/docs).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plaid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plaid --pre

The gem supports Ruby 2.4.0+ only.

### Versioning

Each major version of `plaid-ruby` targets a specific version of the Plaid API:

| API version | plaid-ruby release |
| ----------- | ------------------ |
| [`2020-09-14`][api-version-2020-09-14] (**latest**) | `12.x.x`, `13.x.x`, `14.x.x` |
| [`2019-05-29`][api-version-2019-05-29] | `11.x.x`, `10.x.x`, `9.x.x`, `8.x.x`, `7.x.x` |
| [`2018-05-22`][api-version-2018-05-22] | `6.x.x` |
| `2017-03-08` | `5.x.x` |

For information about what has changed between versions and how to update your integration, head to the [version changelog][version-changelog].


## Usage

This gem wraps the Plaid API, which is fully described in the [documentation](https://plaid.com/docs/api) and in the [plaid-openapi](https://github.com/plaid/plaid-openapi) spec.

### Creating a Plaid client

Create an instance of the client using the `client_id` and `secret` from your Plaid dashboard along with your environment of choice:

```ruby
require 'plaid'

configuration = Plaid::Configuration.new
configuration.server_index = Plaid::Configuration::Environment["sandbox"]
configuration.api_key["PLAID-CLIENT-ID"] = "***"
configuration.api_key["PLAID-SECRET"] = "***"
configuration.api_key["Plaid-Version"] = "2020-09-14"

api_client = Plaid::ApiClient.new(
  configuration
)

client = Plaid::PlaidApi.new(api_client)
```

The `server_index` field is the environment which the client will be running in. Your choices for the `server_index` field include:

- `Plaid::Configuration::Environment["sandbox"]` allows you to do your initial integrations tests against preloaded data without being billed or making expensive API calls. More information about using the API sandbox can be found on the [API Sandbox documentation](https://plaid.com/docs/api#sandbox).
- `Plaid::Configuration::Environment["development"]` allows you to test against both real and test accounts without being billed. More information about Plaid test accounts can be found in our [API documentation](https://plaid.com/docs/api/#sandbox).
- `Plaid::Configuration::Environment["production"]` is the production environment where you can launch your production ready application and be charged for your Plaid usage.

### Tuning Faraday

The gem uses Faraday to wrap HTTPS connections, which allows you to tune certain params:

```ruby
client = Plaid::Configuration.new do |builder|
  Plaid::Configuration.default()

  # Increase network timeout
  builder.options[:timeout] = 60*20    # 20 minutes
end
```

## Examples

### Create a new link_token

```ruby
# Grab the client_user_id by searching for the current user in your database
user = User.find_by!(email: '***')
client_user_id = user.id

# Create the link_token with all of your configurations
link_token_create_request = Plaid::LinkTokenCreateRequest.new({
  :user => { :client_user_id => client_user_id.to_s },
  :client_name => 'My app',
  :products => %w[auth transactions],
  :country_codes => ['US'],
  :language => 'en'
})

link_token_response = client.link_token_create(
  link_token_create_request
)

# Pass the result to your client-side app to initialize Link
#  and retrieve a public_token
link_token = link_token_response.link_token
```

### Exchanging a Link public_token for a Plaid access_token

If you have a [Link](https://github.com/plaid/link) `public token`, use this function to get an `access_token`: `client.item_public_token_exchange(request)`

An example of the function's usage if you have a `public_token` in hand:

```ruby
request = Plaid::ItemPublicTokenExchangeRequest.new
request.public_token = public_token

response = client.item.public_token_exchange(request)
access_token = response.access_token
```

### Deleting an item

```ruby
request = Plaid::ItemPublicTokenExchangeRequest.new
request.public_token = public_token

response = client.item.public_token_exchange(request)
access_token = response.access_token

# Provide the access_token for the Item you want to remove
item_remove_request = Plaid::ItemRemoveRequest.new
item_remove_request.access_token = access_token

client.item_remove(item_remove_request)
```

### Get paginated transactions
```ruby
request = Plaid::ItemPublicTokenExchangeRequest.new
request.public_token = public_token

response = client.item.public_token_exchange(request)
access_token = response.access_token

transactions_get_request = Plaid::TransactionsGetRequest.new
transactions_get_request.access_token = access_token
transactions_get_request.start_date = "2020-01-01"
transactions_get_request.end_date = "2021-01-01"

transaction_response = client.transactions_get(transactions_get_request)
transactions = transaction_response.transactions

# the transactions in the response are paginated, so make multiple calls while
# increasing the offset to retrieve all transactions
while transactions.length < transaction_response['total_transactions']
  options_payload = {}
  options_payload[:offset] = transactions.length

  transactions_get_request = Plaid::TransactionsGetRequest.new
  transactions_get_request.access_token = access_token
  transactions_get_request.start_date = "2020-01-01"
  transactions_get_request.end_date = "2021-01-01"

  transaction_response = client.transactions_get(transactions_get_request)
  transactions += transaction_response.transactions
end

```

### Obtaining Item-related data

If you have an `access_token`, you can use following code to retreive data:
```ruby
request = Plaid::ItemPublicTokenExchangeRequest.new
request.public_token = public_token

response = client.item.public_token_exchange(request)
access_token = response.access_token

auth_get_request = Plaid::AuthGetRequest.new
auth_get_request.access_token = access_token

auth_response = client.auth_get(access_token)
auth = auth_response.auth
```

There are also a number of other methods you can use to retrieve data:

* `client.accounts_get(Plaid::AccountsGetRequest({:access_token => access_token, ...}))`: accounts
* `client.accounts_balance_get(Plaid::AccountsBalanceGetRequest({:access_token => access_token, ...}))`: real-time balances
* `client.auth_get(Plaid::AuthGetRequest({:access_token => access_token, ...}))`: auth
* `client.identity_get(Plaid::IdentityGetRequest({:access_token => access_token, ...}))`: identity
* `client.transactions_get(Plaid::TransactionsGetRequest({:access_token => access_token, ...}))`: transactions
* `client.investments_transactions_get(Plaid::InvestmentsTransactionsGetRequest({:access_token => access_token, ...}))`: investment-account transactions
* `client.investments_holdings_get(Plaid::InvestmentsHoldingsGetRequest({:access_token => access_token, ...}))`: investment-account holdings

All of these methods return appropriate data. More information can be found on the [API documentation](https://plaid.com/docs/api).

### Create a Stripe bank_account_token

Exchange a Plaid Link `public_token` for an API `access_token` and a Stripe `bank_account_token`:
```ruby
request = Plaid::ItemPublicTokenExchangeRequest.new
request.public_token = public_token

response = client.item.public_token.exchange(request)
access_token = response.access_token

processor_token_create_request = Plaid::ProcessorStripeBankAccountTokenCreateRequest.new
processor_token_create_request.access_token = access_token
processor_token_create_request.account_id = '[Account ID]'

stripe_response = client.processor_stripe_bank_account_token_create(processor_token_create_request)
bank_account_token = stripe_response.stripe_bank_account_token
```

### Categories

You can request category information:

```ruby
categories = client.categories_get             # Array of all known categories
```

### Institutions

Financial institution information is available as shown below where the function arguments represent count and offset:

```ruby
institutions_get_request = Plaid::InstitutionsGetRequest.new({
  :count => 3,
  :offset => 1,
  :country_codes => ["US"],
})

response = client.institutions_get(institutions_get_request)
```

## Errors

Any methods making API calls will result in an exception raised unless the response code is "200: Success" or
"210: MFA Required".

`Plaid::ApiError` is returned in response to API internal server errors.

Read more about response codes and their meaning in the
[Plaid documentation](https://plaid.com/docs/api).

## Response Objects

Any API call returns a response object which is accessible by dot notation
(`response.foo.bar`) or Symbols and Strings as keys: `response[:foo][:bar]`
and `response['foo']['bar']`. Expected keys for all types of responses are defined,
and any attempt to access an unknown key will cause `NoMethodError` exception.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/plaid/plaid-ruby. See also [contributing guidelines](CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

### Legacy API

If you're looking for a Ruby client that works with the legacy Plaid API, use the [`plaid-legacy` gem][2].

[2]: https://github.com/plaid/plaid-ruby-legacy
[version-changelog]: https://plaid.com/docs/api/versioning/
[api-version-2018-05-22]: https://plaid.com/docs/api/versioning/#2018-05-22
[api-version-2019-05-29]: https://plaid.com/docs/api/versioning/#2019-05-29
[api-version-2020-09-14]: https://plaid.com/docs/api/versioning/#2020-09-14
