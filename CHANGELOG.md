# 14.0.0.beta.5
Generated from OAS version 2020-09-14_1.16.4. See full changelog [here](https://github.com/plaid/plaid-openapi/blob/master/CHANGELOG.md).

# 14.0.0.beta.4
See full changelog [here](https://github.com/plaid/plaid-openapi/blob/master/CHANGELOG.md).
- Remove validation for `maxProperties` due to generator bug.

# 14.0.0.beta.3
Type fixes, see full changelog [here](https://github.com/plaid/plaid-openapi/blob/master/CHANGELOG.md).

# 14.0.0.beta.1

This version represents a transition in how we maintain our external client libraries. We are now using an [API spec](https://github.com/plaid/plaid-openapi) written in `OpenAPI 3.0.0` and running our definition file through [OpenAPITool's `python` generator](https://github.com/OpenAPITools/openapi-generator).

The minimum required ruby version is 2.7.1.

**Ruby Migration Guide:**

### Client initialization
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

### Endpoints
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

### Errors

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

# 13.0.0
- Add support for providing a payment initiation schedule
- Add back the (now deprecated) `/item/public_token/create` endpoint
- Add back the (now deprecated) `/payment_initiation/payment/token/create` endpoint

BREAKING CHANGES:

- Update minimum required Ruby version to 2.4

# 12.0.0

- The library has been pinned to the '2020-09-14' API release. Visit the [docs](https://plaid.com/docs/api/versioning/) to see what changed.
- the `/item/public_token/create` endpoint has been disabled in favor of the /link/token/create
    endpoint
- The `/item/add_token/create endpoint` has been disabled in favor of the /link/token/create
- The `/payment_initiation/payment/token/create` endpoint has been disabled in favor of the /link/token/create
    endpoint
- The `/item/remove` endpoint will no longer return a `removed` boolean.
- The `/institutions/get`, `/institutions/get_by_id`, and `/institutions/search` now require
    `country_codes` to be passed in.

# 11.1.0

- Add support for Link Token get endpoint ([#301](https://github.com/plaid/plaid-ruby/pull/301))
  - `link/token/get`

# 11.0.0

- Add `merchant_name` to `Transaction` (#294)

BREAKING CHANGES:

- Removes the public key as input to `Client`. The public key is no longer needed by the API. (#287)
- Add link/token/create support (#293)

# 10.1.0

- Add support for more options (`override_username`, `override_password`) in the `/sandbox/public_token/create` endpoint ([219](https://github.com/plaid/plaid-ruby/pull/219))

# 10.0.0

- Add support for optional user fields for `/item/add_token/create` endpoint ([278](https://github.com/plaid/plaid-ruby/pull/278))
- Add support for credit card liabilities ([286](https://github.com/plaid/plaid-ruby/pull/286))

BREAKING CHANGES:

- `RATE_LIMIT_EXCEEDED` Plaid error types will be correctly mapped to `RateLimitExceededError` ([285](https://github.com/plaid/plaid-ruby/pull/285))
- `INSTITUTION_ERROR` Plaid error types will be correctly mapped to `InstitutionError` ([275](https://github.com/plaid/plaid-ruby/pull/275))
- Enable payment recipient to be created with BACS ([288](https://github.com/plaid/plaid-ruby/pull/288))

# 9.0.0

- Adds support for `/sandbox/item/set_verification_status`
- Removes support for deprecated `/item/access_token/update_version` endpoint

BREAKING CHANGES:

- Removes `client.item.update_version`

# 8.9.0 16-Apr-2020

- Add client_user_id to Item add token endpoint ([#274](https://github.com/plaid/plaid-ruby/pull/274))

# 8.8.0 02-Apr-2020

- Add support for Item add token endpoint (BETA) ([#269](https://github.com/plaid/plaid-ruby/pull/269))
  - `/item/add_token/create`

# 8.7.0 05-Mar-2020

- Add transaction_code to Transaction class ([#264](https://github.com/plaid/plaid-ruby/pull/264))
- Add OAuth support to /institutions endpoints ([#261](https://github.com/plaid/plaid-ruby/pull/261))

# 8.6.0 20-Feb-2020

- Add support for transactions refresh product ([#258](https://github.com/plaid/plaid-ruby/pull/258))
  - `/transactions/refresh`

# 8.5.0 10-Feb-2020

- Add support for deposit switch product ([#251](https://github.com/plaid/plaid-ruby/pull/251))
- Add support for generic processor token ([#256](https://github.com/plaid/plaid-ruby/pull/256))
- Add support for webhook verification ([#249](https://github.com/plaid/plaid-ruby/pull/249))

# 8.4.0 23-Jan-2020

- Add support for new UK Payment Initiation product ([#246](https://github.com/plaid/plaid-ruby/pull/246))
  - `/payment_initiation/recipient/create`
  - `/payment_initiation/recipient/get`
  - `/payment_initiation/recipient/list`
  - `/payment_initiation/payment/create`
  - `/payment_initiation/payment/token/create`
  - `/payment_initiation/payment/get`
  - `/payment_initiation/payment/list`
- Add `consent_expiration_time` to the Item interface ([#247](https://github.com/plaid/plaid-ruby/pull/247))

# 8.3.0 17-Sep-2019

- Add support for new [Ocrolus Partnership](https://plaid.com/docs/ocrolus/)

# 8.2.0 16-Sep-2019

- Update Assets schema for international address support

# 8.1.0 23-Jul-2019

- Add binding for the new [liabilities product](https://plaid.com/docs/api/#liabilities)

# 8.0.0 19-Jun-2019

- Deprecate direct integration as it is no longer supported

# 7.1.0 17-Jun-2019

- Add bindings for the new [investments product](https://plaid.com/docs/api/#investments).

# 7.0.0 20-May-2019

- Add support for 2019-05-29 API version

# 6.3.1 20-Mar-2019

- Remove unnecessary log line

# 6.3.0 5-Mar-2019

- Add support for include_institution_data to /institutions/search endpoint.
- Add support for include_institution_data to /institutions/get endpoint.
- Add support for include_institution data to /institutions/get_by_id endpoint.

# 6.2.1 14-Feb-2019

- Fix error models to support assets-related errors.

# 6.2.0 28-Nov-2018

- Assets + Insights reports

# 6.1.0 20-Jun-2018

- Add bindings for the new [assets product](https://plaid.com/docs/api/#assets).

# 6.0.0 22-May-2018

- Use `Plaid-Version` header to request the certain compatible API version.
- Change Auth-related data structures to conform to the API.
- Include currency-related fields for transaction and account objects.

# 5.0.0 23-Mar-2018

- Introduce true response objects instead of deep nested hashes. Any of the
  three syntaxes can be used interchangeably for any API response:
  `response['foo']['bar']`, `response[:foo][:bar]`, or `response.foo.bar`.
- Add Dwolla and Apex products.

# 4.1.0 04-Jan-2018

- Make `/item/remove` the primary Item removal endpoint
- Add #options parameter to `/institutions/get`
- Handle network errors with `PlaidServerError`

# 4.0.0 09-Mar-2017

- Refactored the entire library to support [Plaid's new API](https://blog.plaid.com/improving-our-api/). Use the [transition guide](https://plaid.com/docs/link/transition-guide) to update your integration. Version 3.x.x of this gem is mirrored at [plaid-legacy](https://github.com/plaid/plaid-ruby-legacy).

# 3.0.0. 17-Jan-2017

- Add `/institutions/all` and `/institutions/all/search` endpoints, see [UPGRADING.md](UPGRADING.md#upgrading-from-2xx-to-300)

# 2.2.0. 03-Nov-2016

- Add `Transaction#reference_number` (@ericbirdsall).
- Fix webhook codes and add risk and income webhooks.

# 2.1.0. 19-Oct-2016

- Documentation fixes (@ishmael).
- Fix `Transaction#to_s` behavior (@michel-tricot).
- PATCH `/:product/step` flow.
- Use the same client in `User#upgrade` (@betesh).
- Webhook object (@zshannon).
- `processor_token` access in `User.exchange_token` (@gylaz).
- Raise `ServerError` in case server returned an empty response body.

# 2.0.0. 24-May-2016

- Use `~> 1.0` spec for multi_json dependency.
- Support `stripe_bank_account_token` in `User.exchange_token`.

# 2.0.0.alpha.2. 14-May-2016

- Use `:production` instead of `:api` to signify production environment
  in `Plaid::Client#env=`.
- `User#mfa_step` allows to specify options now (thanks @gcweeks).
- Implemented `User#update_webhook`.

# 2.0.0.alpha. 06-May-2016

- Rewrite everything.
