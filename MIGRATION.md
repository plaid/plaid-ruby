# Ruby SDK Migration Guide

Learn how to migrate to version 54 of the Plaid Ruby SDK, or continue using the previous SDK.

## Overview

Version 54 of the `plaid` gem introduces a new SDK. Plaid can release updates to the new SDK more frequently, so new API features will be available in the SDK sooner after they launch.

Version 54 also includes the previous SDK as `Plaid::Legacy`, and each version 54 release updates it with the same API changes as the new SDK. Plaid has not set a date to remove `Plaid::Legacy`, so you can migrate at your own pace.

### Summary of updates

- Endpoints are grouped by product, such as `client.accounts.get` and `client.link.create_token`, instead of being methods on a single client.
- Calls take keyword arguments instead of a request model, and nested requests can use hashes.
- The client is configured with constructor keywords instead of a `Plaid::Configuration` object.
- Many paginated endpoints return an iterator, so you do not need to write your own pagination loop.
- Errors are raised as subclasses of `Plaid::Errors::ApiError` by HTTP status, and include the parsed Plaid error.
- Dates and timestamps are ISO 8601 strings instead of `Date` and `Time` objects.
- Downloads return a binary `String` instead of a temporary file.
- The new SDK uses `Net::HTTP` instead of Faraday.

## Migration walkthrough

You can upgrade to version 54 without changing any calls, then migrate to the new SDK one workflow at a time.

## Install version 54

Update the `plaid` requirement in your Gemfile, then run `bundle update plaid`:

```ruby
gem 'plaid', '~> 54.0'
```

> [!NOTE]
> Version 54 supports Ruby 3.3 and later.

## Switch your requires to the legacy namespace

Both SDKs ship in the `plaid` gem, each with its own entry point:

| SDK          | Require                 | Namespace       |
| ------------ | ----------------------- | --------------- |
| New SDK      | `require 'plaid'`       | `Plaid`         |
| Previous SDK | `require 'plaid/legacy'` | `Plaid::Legacy` |

To keep existing code working, change `require 'plaid'` to `require 'plaid/legacy'` and prefix constants with `Plaid::Legacy` instead of `Plaid`:

```ruby
require 'plaid/legacy'

configuration = Plaid::Legacy::Configuration.new
configuration.server_index = Plaid::Legacy::Configuration::Environment['sandbox']
configuration.api_key['PLAID-CLIENT-ID'] = ENV.fetch('PLAID_CLIENT_ID')
configuration.api_key['PLAID-SECRET'] = ENV.fetch('PLAID_SECRET')
legacy_client = Plaid::Legacy::PlaidApi.new(Plaid::Legacy::ApiClient.new(configuration))
```

`require 'plaid/legacy'` doesn't load the new SDK, so require both where one process uses both.

Rails and other apps that use `Bundler.require` load the gem automatically, so they have no `require 'plaid'` to change. Set the entry point in the Gemfile instead:

```ruby
gem 'plaid', '~> 54.0', require: 'plaid/legacy'
```

Once the app uses both SDKs, change it to `require: ['plaid', 'plaid/legacy']`.

## Create a client with the new SDK

**Previous SDK**

```ruby
require 'plaid'

configuration = Plaid::Configuration.new
configuration.server_index = Plaid::Configuration::Environment['sandbox']
configuration.api_key['PLAID-CLIENT-ID'] = ENV.fetch('PLAID_CLIENT_ID')
configuration.api_key['PLAID-SECRET'] = ENV.fetch('PLAID_SECRET')
configuration.api_key['Plaid-Version'] = '2020-09-14'
client = Plaid::PlaidApi.new(Plaid::ApiClient.new(configuration))
```

**New SDK**

```ruby
require 'plaid'

client = Plaid::PlaidApi.new(
  base_url: Plaid::Environment::SANDBOX,
  client_id: ENV.fetch('PLAID_CLIENT_ID'),
  secret: ENV.fetch('PLAID_SECRET'),
  version: '2020-09-14'
)
```

Use `Plaid::Environment::PRODUCTION` for Production. The client reads `PLAID_CLIENT_ID`, `PLAID_SECRET`, and `PLAID_VERSION` from the environment when their keywords are omitted, and the API version defaults to `2020-09-14`. Using `ENV.fetch` makes missing credentials fail when the client is created rather than on the first request.

> [!WARNING]
> Always set `base_url` explicitly. A client created without one, or with `base_url: nil`, sends requests to Production. An empty string does not select Sandbox.

### Retries

Like the previous SDK, the new SDK does not retry failed requests by default. To retry requests that fail with HTTP 408, 429, 502, 503, or 504, set `max_retries`, which counts retries after the first attempt. The SDK does not retry other 5xx responses, timeouts, or connection errors.

Before enabling retries for operations that move money, such as `/transfer/create` or `/payment_initiation/payment/create`, make sure a repeated request is safe. A request that failed with a 5xx error may already have succeeded.

### Timeouts and HTTP customization

The constructor's `timeout`, 60 seconds by default, applies separately to opening the connection, reading, and writing. It is not a deadline for a multi-page traversal or for all retries of a request. To override it for one call, pass `request_options: { timeout_in_seconds: 30 }`.

Faraday middleware, adapters, stubs, SSL options, and interceptors configured for the previous SDK do not apply to the new SDK, which uses `Net::HTTP`. Recreate only the HTTP behavior your application needs, such as proxy, TLS, or logging settings.

To send additional headers on one request, pass `request_options: { additional_headers: { ... } }` with string values. `Plaid-Version` and `PLAID-CLIENT-ID` can be overridden this way; to use a different secret, create a client with that secret.

## Migrate calls one endpoint at a time

Replace each call to the previous SDK with the equivalent call to the new SDK. The following table summarizes the differences:

| Area                | Previous SDK                                  | New SDK                                                        |
| ------------------- | --------------------------------------------- | -------------------------------------------------------------- |
| Client              | `Plaid::PlaidApi` with `Plaid::Configuration` | `Plaid::PlaidApi` with constructor keywords                    |
| Calls               | `client.accounts_get(request)`                | `client.accounts.get(access_token: token)`                     |
| Requests            | Request model                                 | Keyword arguments, with nested hashes or models                |
| Responses           | Generated model                               | Usually a `Plaid::Types` model; paginated methods return an iterator |
| Exporting models    | `to_hash`                                     | `to_h`, then `JSON.generate`                                   |
| Dates and timestamps | `Date` or `Time`                              | ISO 8601 strings                                               |
| Errors              | `Plaid::ApiError`                             | `Plaid::Errors::ApiError` and subclasses                       |
| Downloads           | Temporary file                                | Binary `String`                                                |
| Pagination          | Your own loop                                 | Iterator on supported endpoints                                |
| Status and headers  | `_with_http_info`                             | Not returned; use `request_id` from the response body          |
| Retries             | None                                          | None unless you set `max_retries`                              |
| Field names         | `snake_case`                                  | `snake_case`, with some model and method-name changes          |

**Previous SDK**

```ruby
response = client.accounts_get(
  Plaid::AccountsGetRequest.new(access_token: access_token)
)
response.accounts.each do |account|
  puts account.account_id
end
```

**New SDK**

```ruby
response = client.accounts.get(access_token: access_token)
response.accounts.each do |account|
  puts account.account_id
end
```

Nested requests can use hashes:

```ruby
response = client.link.create_token(
  client_name: 'My App',
  language: 'en',
  country_codes: ['US'],
  products: ['transactions'],
  user: { client_user_id: user_id }
)
link_token = response.link_token
```

### Getting an access token

Exchange the public token returned by Link before calling Item APIs:

```ruby
response = client.item.exchange_public_token(public_token: public_token)
access_token = response.access_token
```

### Method names

To find a call's new method, search the SDK's `reference.md` for the endpoint's path, such as `/accounts/get`. It lists every method with its arguments and return type.

Field names generally remain `snake_case`, but model names, acronym casing, and names that collide with Ruby methods can change. Request types can live under a product namespace, such as `Plaid::Accounts::Types::AccountsGetRequest`, and response types generally live under `Plaid::Types`. Endpoint methods take keyword arguments, so renaming a request model does not update the call.

### Enums

Enums are string values. For example, use `'transactions'` or `Plaid::Types::Products::TRANSACTIONS`. Every enum is a module under `Plaid::Types`, such as `Plaid::Types::CountryCode::US`. Handle values you have not seen before instead of raising, because Plaid can add enum values.

### Default values

The previous SDK's request models filled in some fields that you did not set, such as `count: 100` on `TransactionsSyncRequest`. These values are the defaults listed for each field in the [API reference](https://plaid.com/docs/api/), which Plaid also applies when a field is omitted. The new SDK sends only the fields you set, so you do not need to set these values yourself.

### Nullable fields and empty collections

For nullable request fields, omitting a keyword and passing `nil` send different requests:

```ruby
# Omits identity.
client.user.update(user_id: user_id)

# Sends identity: null.
client.user.update(user_id: user_id, identity: nil)
```

The SDK sends an explicit `null` for optional nullable fields set to `nil`, and omits optional fields that are not nullable. An empty array or hash is different from `nil`, and `false` and `0` are values, not missing fields, so do not call `compact` or remove empty collections from request data.

Some required-field and bounds checks that the previous SDK made when building a model are now made by the API. If an input must be rejected before a request is sent, validate it in your application.

### Reading and exporting models

Read attributes directly:

```ruby
account = response.accounts.first
balance = account&.balances&.current
```

To get a hash or JSON document, replace `to_hash` and model indexing with:

```ruby
attributes = response.to_h
json = JSON.generate(attributes)
plain_hash = JSON.parse(json)
```

Exports use API field names as string keys. Some unknown union values are raw hashes with symbol keys, so round-trip through JSON when you need string keys throughout. `model.to_json` does not reproduce the previous SDK's serializer, and exports can differ in key presence, ordering, and date formatting.

Unknown response fields are kept in exports. A field whose name collides with a model method is not installed as a method, so read it from the exported hash. An unknown union alternative can be a hash rather than a model, so check which it is before reading it.

`dup` and `clone` copy only a model's top-level fields. Copy nested arrays, hashes, and models before mutating them if the original must not change.

### Numbers

Response models use `Float` for number fields, as the previous SDK does, and `Integer` for integer fields. Integer request values stay integers rather than being converted to `Float`. If you need decimal arithmetic, convert values yourself; converting an already-rounded `Float` to `BigDecimal` cannot recover lost digits.

### Dates and timestamps

Dates and timestamps are strings. Parse them where your application relied on `Date` and `Time` objects:

```ruby
require 'date'
require 'time'

date = transaction.date && Date.iso8601(transaction.date)
authorized_at = transaction.authorized_datetime && Time.iso8601(transaction.authorized_datetime)
```

Send dates as `YYYY-MM-DD` strings and timestamps in ISO 8601. To forward an API value unchanged, keep the original string rather than reformatting it.

`initiated_date` in `/item/activity/list` responses can include a time, although the API reference describes it as a date. The previous SDK parsed it as a `Date` and dropped the time; the new SDK returns the string unchanged.

### Status codes and headers

Calls no longer return the HTTP status code and headers, and the new SDK has no equivalent of `_with_http_info`. Most responses include `request_id` in the body:

```ruby
response = client.accounts.get(access_token: access_token)
request_id = response.request_id
```

Paginated methods expose the most recent page's `Net::HTTPResponse` through `pager.http_response`. Errors carry their status and headers, as described in [Update error handling](#update-error-handling).

### Downloads

Downloads return a binary `String` instead of a temporary file:

```ruby
bytes = client.asset_report.get_pdf(asset_report_token: asset_report_token)
File.binwrite('asset-report.pdf', bytes)
```

The response is held in memory. If another library needs a file, write the bytes to a `Tempfile` in binary mode.

### Uploads

Uploads send the file's contents. The previous SDK sent a JSON description of the file instead. Pass a file path or an open file, opened in binary mode. A `String` is read as a file path, so wrap bytes already in memory in `StringIO`. For `/transfer/diligence/document/upload`, see `client.transfer.diligence.upload_document` in `reference.md`.

### Webhooks

Verify webhook signatures against the original request body. Decoding the body into a model and serializing it again can change the bytes.

## Update pagination logic

Paginated methods such as `transactions.get` and `institutions.get` return an iterator instead of the response model, so code that reads `response.accounts` or `response.total_transactions` from a single call raises `NoMethodError`. Check each method's return type in `reference.md`: paginated methods return `Plaid::Internal::OffsetItemIterator` or `Plaid::Internal::CursorItemIterator`.

Iterators are lazy, so creating one does not send a request. Rescue errors around the loop, including errors from the first page:

```ruby
pager = client.institutions.get(country_codes: ['US'], count: 100, offset: 0)
pager.each do |institution|
  process(institution)
end
```

To read full pages rather than individual items:

```ruby
pager = client.transactions.get(
  access_token: access_token,
  start_date: start_date,
  end_date: end_date,
  options: { count: 100, offset: 0 }
)
pager.pages.each do |page|
  process(page.transactions)
  total = page.total_transactions
end
```

- To make one request and read the whole response, use `pager.pages.first`. It can return `nil` if there are no results.
- To raise a first-page error at a point you choose, call `pager.load_first_page`. Later loops reuse that page.
- `pager.first` returns an item, while `pager.pages.first` returns a page.
- Each `each` or `to_a` sends new requests. If the results fit in memory, call `to_a` once and reuse the array.
- An offset traversal stops when a page comes back empty, so reading every page sends one more request than there are pages of results.
- Do not call `pages.next?` after a traversal has finished. To start again, call `rewind` or start a new traversal.

### Sync transactions

`transactions.sync` returns `added`, `modified`, and `removed` arrays rather than an iterator, so keep your cursor loop. A `nil` cursor is left out of the request, the same as starting from the beginning. Save the final cursor only after you have applied the complete update:

```ruby
cursor = saved_cursor || ''
added = []
modified = []
removed = []

loop do
  page = client.transactions.sync(access_token: access_token, cursor: cursor)
  added.concat(page.added)
  modified.concat(page.modified)
  removed.concat(page.removed)
  cursor = page.next_cursor
  break unless page.has_more
end

# Apply added, modified, and removed, then save cursor.
```

If the API returns `TRANSACTIONS_SYNC_MUTATION_DURING_PAGINATION`, discard the partial update and restart from the cursor you saved before the loop.

## Update error handling

Replace `rescue Plaid::ApiError` with the new error classes. A response error exposes the HTTP status as `code`, the parsed Plaid error as `body`, the raw response body as `message`, and the response headers as `headers`:

```ruby
begin
  response = client.accounts.get(access_token: access_token)
rescue Plaid::Errors::ResponseError => error
  if error.body&.error_code == 'ITEM_LOGIN_REQUIRED'
    # Start your Link update mode flow.
  end
  status = error.code
  request_id = error.body&.request_id
  raise
rescue Plaid::Errors::TimeoutError, Plaid::Errors::ConnectionError => error
  # The request may have reached Plaid.
  raise
end
```

| Status       | Error class                |
| ------------ | -------------------------- |
| 3xx          | `RedirectError`            |
| 401          | `UnauthorizedError`        |
| 403          | `ForbiddenError`           |
| 404          | `NotFoundError`            |
| Other 4xx    | `ClientError`              |
| 503          | `ServiceUnavailableError`  |
| Other 5xx    | `ServerError`              |

`ServiceUnavailableError` is not a subclass of `ServerError`, so `rescue Plaid::Errors::ServerError` doesn't catch a 503. Rescue both, or rescue `ResponseError` and check `code`. To catch every SDK error in one clause, rescue `Plaid::Errors::ApiError`.

- `body` is a `Plaid::Types::PlaidError`, or `nil` when the error response is empty, malformed, or not a Plaid error. Replace `JSON.parse(e.response_body)['error_code']` with `error.body&.error_code`.
- A successful response with malformed JSON raises `ResponseError` with a 2xx `code`. A successful empty response returns `nil`.
- `message` contains the raw response body, not the previous SDK's formatted message.
- Header lookups ignore capitalization, and values are arrays. `error.header('Retry-After')` returns the first value as a string.

## Remove the legacy namespace

After you have migrated every call, remove `require 'plaid/legacy'` and the `Plaid::Legacy` client.

## Getting help

For help with the Ruby SDK, open an issue in the [Plaid Ruby SDK repository](https://github.com/plaid/plaid-ruby/issues) and include the SDK version, endpoint, and request ID.
