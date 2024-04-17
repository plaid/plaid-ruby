# plaid-ruby [![Gem Version](https://badge.fury.io/rb/plaid.svg)](http://badge.fury.io/rb/plaid)

The official Ruby bindings for the [Plaid API](https://plaid.com/docs). It's generated from our [OpenAPI schema](https://github.com/plaid/plaid-openapi).

## Table of Contents

* [Installation](#installation)
* [Versioning](#versioning)
* [Getting Started](#getting-started)
  + [Create a client](#create-a-client)
  + [Tuning Faraday](#tuning-faraday)
  + [Dates](#dates)
* [Examples](#examples)
* [Errors](#errors)
* [Response objects](#response-objects)
* [Migration Guide](#migration-guide)
* [Contributing](#contributing)
* [License](#license)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plaid'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install plaid

The gem supports Ruby 3.0.0+ only.

### Versioning

Versions > 14 are generated from our OpenAPI schema. 

Each major version of `plaid-ruby` targets a specific version of the Plaid API:

| API version | plaid-ruby release |
| ----------- | ------------------ |
| [`2020-09-14`][api-version-2020-09-14] (**latest**) | `12.x.x` and higher |
| [`2019-05-29`][api-version-2019-05-29] | `11.x.x`, `10.x.x`, `9.x.x`, `8.x.x`, `7.x.x` |
| [`2018-05-22`][api-version-2018-05-22] | `6.x.x` |
| `2017-03-08` | `5.x.x` |

For information about what has changed between versions and how to update your integration, head to the [version changelog][version-changelog].

The plaid-ruby client library is typically updated on a monthly basis. The canonical source for the latest version number is the [client library changelog](https://github.com/plaid/plaid-ruby/blob/master/CHANGELOG.md). New versions are published as [GitHub tags](https://github.com/plaid/plaid-ruby/tags), not as Releases. New versions are also published on [RubyGems.org](https://rubygems.org/gems/plaid/).


All users are strongly recommended to use a recent version of the library, as older versions do not contain support for new endpoints and fields. For more details, see the [Migration Guide](#migration-guide).

## Getting started

### Create a client

Create an instance of the client using the `client_id` and `secret` from your Plaid dashboard along with your environment of choice:

```ruby
require 'plaid'

configuration = Plaid::Configuration.new
configuration.server_index = Plaid::Configuration::Environment["sandbox"]
configuration.api_key["PLAID-CLIENT-ID"] = "***"
configuration.api_key["PLAID-SECRET"] = "***"

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
configuration = Plaid::Configuration.new
api_client = Plaid::ApiClient.new(
  configuration
)
api_client.connection.options[:timeout] = 60*20 # 20 minutes
```

To use custom middleware, reinitialize the Faraday::Connection object:
```
configuration = Plaid::Configuration.new
api_client = Plaid::ApiClient.new(configuration)
api_client.create_connection do |builder|
  builder.use Faraday::Response::Logger
end
```

### Dates

Dates and datetimes in requests, which are represented as strings in the API and previous versions of the client library, are represented in this version of the Ruby client library as Ruby `Date` or `DateTime` objects. 

Time zone information is required for request fields that accept datetimes. Failing to include time zone information (or passing in a string, instead of a `Date` or `DateTime` object) will result in an error. See the following examples for guidance on `Date` and `DateTime` usage.

If the API reference documentation for a field specifies `format: date`, any of following are acceptable:

```rb
require 'date'

# Not an exhaustive list of possible options
a = Date.new(2022, 5, 5)
b = Date.new(2022, 5, 5).to_date
c = Date.parse('2022-05-05')
d = Date.parse('2022-05-05').to_date
e = Date.today
```

If the API reference documentation for a field specifies `format: date-time`, either of the following are acceptable:

```rb
require 'time'

# Not an exhaustive list of possible options
a = Time.parse("2022-05-06T22:35:49Z").to_datetime
b = Date.parse("2022-05-06T22:35:49Z").to_datetime
```


## Examples

For more examples, see the [test suites](https://github.com/plaid/plaid-ruby/tree/master/test), [Quickstart](https://github.com/plaid/quickstart/tree/master/ruby), or [API Reference documentation](https://plaid.com/docs/api/).

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

If you have a [Link](https://plaid.com/docs/link/) `public token`, use this function to get an `access_token`: `client.item_public_token_exchange(request)`

An example of the function's usage if you have a `public_token` in hand:

```ruby
request = Plaid::ItemPublicTokenExchangeRequest.new
request.public_token = public_token

response = client.item_public_token_exchange(request)
access_token = response.access_token
```

### Deleting an item

```ruby
request = Plaid::ItemPublicTokenExchangeRequest.new
request.public_token = public_token

response = client.item_public_token_exchange(request)
access_token = response.access_token

# Provide the access_token for the Item you want to remove
item_remove_request = Plaid::ItemRemoveRequest.new
item_remove_request.access_token = access_token

client.item_remove(item_remove_request)
```

### Get paginated transactions (preferred method)
```ruby
request = Plaid::ItemPublicTokenExchangeRequest.new
request.public_token = public_token

response = client.item_public_token_exchange(request)
access_token = response.access_token

transactions_sync_request = Plaid::TransactionsSyncRequest.new
transactions_sync_request.access_token = access_token

transaction_response = client.transactions_sync(transactions_sync_request)
transactions = transaction_response.added

# the transactions in the response are paginated, so make multiple calls while
# updating the cursor to retrieve all transactions
while transaction_response.has_more
  transactions_sync_request = Plaid::TransactionsSyncRequest.new
  transactions_sync_request.access_token = access_token
  transactions_sync_request.cursor = transaction_response.next_cursor

  transaction_response = client.transactions_sync(transactions_sync_request)
  transactions += transaction_response.added
end
```

### Get paginated transactions (older method)
```ruby
request = Plaid::ItemPublicTokenExchangeRequest.new
request.public_token = public_token

response = client.item_public_token_exchange(request)
access_token = response.access_token

transactions_get_request = Plaid::TransactionsGetRequest.new
transactions_get_request.access_token = access_token
transactions_get_request.start_date = "2020-01-01"
transactions_get_request.end_date = "2021-01-01"

transaction_response = client.transactions_get(transactions_get_request)
transactions = transaction_response.transactions

# the transactions in the response are paginated, so make multiple calls while
# increasing the offset to retrieve all transactions
while transactions.length < transaction_response.total_transactions
  options_payload = {}
  options_payload[:offset] = transactions.length

  transactions_get_request = Plaid::TransactionsGetRequest.new
  transactions_get_request.access_token = access_token
  transactions_get_request.start_date = "2020-01-01"
  transactions_get_request.end_date = "2021-01-01"
  transactions_get_request.options = options_payload

  transaction_response = client.transactions_get(transactions_get_request)
  transactions += transaction_response.transactions
end
```

### Get Auth data

```ruby
request = Plaid::ItemPublicTokenExchangeRequest.new
request.public_token = public_token

response = client.item_public_token_exchange(request)
access_token = response.access_token

auth_get_request = Plaid::AuthGetRequest.new
auth_get_request.access_token = access_token

auth_response = client.auth_get(auth_get_request)
auth = auth_response.auth
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

All API calls return a response object that is accessible only with dot notation
(i.e., `response.foo.bar`) and not with bracket notation. Expected keys for all types of responses are defined,
and any attempt to access an unknown key will cause `NoMethodError` exception.


## Migration guide

### 14.0.0 or later to latest

Migrating from a version released on or after August 2021 to a recent version should involve very minor integration changes. Many customers will not need to make changes to their integrations at all. To see a list of all potentially-breaking changes since your current version, see the [client library changelog](https://github.com/plaid/plaid-ruby/blob/master/CHANGELOG.md) and search for "Breaking changes in this version". Breaking changes are annotated at the top of each major version header.

### Pre-14.0.0 to latest

Version 14.0.0 of the client library was released in August 2021 and contains multiple interface changes, as described below.


#### Client initialization
From:
```ruby
client = Plaid::Client.new(env: :sandbox,
                            client_id: client_id,
                            secret: secret)
```

To:
```ruby
configuration = Plaid::Configuration.new
configuration.server_index = Plaid::Configuration::Environment["sandbox"]
configuration.api_key["PLAID-CLIENT-ID"] = ENV["PLAID_RUBY_CLIENT_ID"]
configuration.api_key["PLAID-SECRET"] = ENV["PLAID_RUBY_SECRET"]
configuration.api_key["Plaid-Version"] = "2020-09-14"

api_client = Plaid::ApiClient.new(
  configuration
)

client = Plaid::PlaidApi.new(api_client)
```

#### Endpoints
All endpoint requests now take a request model and the functions have been renamed to include `_`.

From:
```ruby
response = client.auth.get(access_token)
```

To:
```ruby
auth_get_request = Plaid::AuthGetRequest.new
auth_get_request.access_token = access_token

or

auth_get_request = Plaid::AuthGetRequest.new({:access_token => access_token})

response = client.auth_get(auth_get_request)
```

#### Errors

From:
```ruby
begin
  client.auth.get(auth_get_request)
rescue Plaid::PlaidAPIError => e
  raise e if e.error_code != 'PRODUCT_NOT_READY'
  sleep 1
end
```

To:
```ruby
begin
  client.auth_get(auth_get_request)
rescue Plaid::ApiError => e
  json_response = JSON.parse(e.response_body)
  if json_response["error_code"] != "PRODUCT_NOT_READY"
end
```


#### Date type differences

See [Dates](#dates) for information on updates to date formats.


## Contributing

Bug reports are welcome on GitHub. See also [contributing guidelines](CONTRIBUTING.md).

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).

[version-changelog]: https://plaid.com/docs/api/versioning/
[api-version-2018-05-22]: https://plaid.com/docs/api/versioning/#2018-05-22
[api-version-2019-05-29]: https://plaid.com/docs/api/versioning/#2019-05-29
[api-version-2020-09-14]: https://plaid.com/docs/api/versioning/#2020-09-14

