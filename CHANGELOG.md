See full changelog for the OpenAPI schema (OAS) [here](https://github.com/plaid/plaid-openapi/blob/master/CHANGELOG.md).

# 15.2.0
- Updating to OAS 2020-09-14_1.94.0

## OpenAPI Schema Changes
### 2020-09-14_1.94.0
- Add `use_case`, `company_legal_name`, `city`, `region`, `country_code`, `postal_code` as a required response field of `Application`

### 2020-09-14_1.93.2
- Remove `income_verification_id` from income webhook example
- Fix incorrect URL for `/user/create` endpoint

### 2020-09-14_1.93.1
- Remove deprecated `income_verification_id` from income webhooks
- Standardize income webhook casing

### 2020-09-14_1.93.0
- Add several new fields to `/signal/evaluate` response
- 
### 2020-09-14_1.92.4
- Add `/sandbox/transfer/fire_webhook` endpoint

### 2020-09-14_1.91.4
- Mark certain Income endpoints as deprecated in favor of the new `/credit/*` endpoints.

### 2020-09-14_1.91.3
- Add `checkout` processor to `/processor/token/create`

### 2020-09-14_1.91.2
- Add `webhook_type` parameter to `/sandbox/item/fire_webhook`
- Support for investments transactions, investments holdings and liabilities `DEFAULT_UPDATE` webhooks

### 2020-09-14_1.90.2
- Add new warning type to `/credit/bank_income/get` response

### 2020-09-14_1.90.1
- Add `marqeta` and `solid` as Auth processor partners
- Fix schema of `cause` parameter for Asset Reports
- Fix some invalid examples
 
### 2020-09-14_1.90.0
- Add `/credit/employment/get` endpoint
- Add optional `access_tokens` array to `/credit/payroll_income/precheck` request

### 2020-09-14_1.89.3
- Update description of `/sandbox/item/fire_webhook`

### 2020-09-14_1.89.2
- Update description of `accounts/get`

### 2020-09-14_1.89.1
- Added `AUTH_DATA_UPDATE` webhook code as valid input to `/sandbox/item/fire_webhook`
- Update description for `/sandbox/item/fire_webhook`

### 2020-09-14_1.89.0
- Add `/transfer/migrate_account` endpoint

### 2020-09-14_1.88.2
- Fix operationId for `/credit/payroll_income/precheck`

### 2020-09-14_1.88.1
- Remove deprecated fields from `/item/application/list`

### 2020-09-14_1.88.0
- Add `wire_routing_number` parameter to `/bank_transfer/migrate_account`

### 2020-09-14_1.87.1
- Specify minimum length of 1 for `description` on `TransferIntentCreateRequest`

### 2020-09-14_1.87.0
- Add `consent_id` support in the Institutions Search request

### 2020-09-14_1.86.1
- Add `apex_clearing` as a processor partner

### 2020-09-14_1.86.0
- Introduce Credit Payroll Income APIs
- Introduce Credit Precheck API

### 2020-09-14_1.85.1
- Add `/identity_verification/create` endpoint, kept private for now

### 2020-09-14_1.85.0
- Add `status` field to `ConnectedApplication`

# 15.1.0
- Updating to OAS 2020-09-14_1.84.5

## OpenAPI Schema Changes
### 2020-09-14_1.84.5
- Added missing `asset_report_id` field to `/asset_report/relay/refresh`

### 2020-09-14_1.84.4
- Change summary description and url for `/credit/bank_income/get`

### 2020-09-14_1.84.3
- Slight wording change for `/credit/bank_income/get` response fields

### 2020-09-14_1.84.3
- Move `user_token` to top level of `link/token/create` request 

### 2020-09-14_1.84.2
- Correct typo in enum value for Investment subtypes (`person` -> `pension`)

### 2020-09-14_1.84.1
- Fix schema to properly handle personal finance categories in `/transactions/get`

### 2020-09-14_1.84.0
- Add `user_token` parameter to `link/token/create`

### 2020-09-14_1.83.1
- Add new fields to `/credit/bank_income/get` response

### 2020-09-14_1.83.0
- Remove `permitted` decision for `/transfer/authorization/create`

### 2020-09-14_1.82.0
- Add beta field `consented_products` to `/item/get/` endpoint response

### 2020-09-14_1.82.0
- Revamp LinkTokenCreate.IncomeVerificationOptions for GA

### 2020-09-14_1.81.0
- Add `/transaction/rules/create`, `/transaction/rules/list` and `/transaction/rules/remove` endpoints

### 2020-09-14_1.80.0
- Added `/user/create` endpoint

# 15.0.0
- Updating to OAS 2020-09-14_1.79.0

## Breaking changes
- Many enum fields have been de-anonymized and renamed, new names can be found in the `2020-09-14_1.64.15` change message
- Non integer numbers are now `float64` fields

## OpenAPI Schema Changes
### 2020-09-14_1.79.0
- Update to include all changes up to `2020-09-14_1.77.4` (Undo revert from `1.78.x` updates)

### 2020-09-14_1.77.4
- Remove the word "Asset" before "Relay" in every asset report relay related responses and request objects

### 2020-09-14_1.77.3
- Add "AssetReport" at the beginning of relay related responses and request objects to match the same pattern as other assets related objects

### 2020-09-14_1.77.2
- Add `ProductAccess` fields for upcoming partner

# 14.14.0
- Updating to OAS 2020-09-14_1.78.2
- Ruby library 14.13.0 was erroneously released as a `minor` version; 14.13.0 changes will be re-released as a `major` version shortly.

# 14.13.0
- Updating to OAS 2020-09-14_1.77.1

# Breaking changes
- Many enum fields have been de-anonymized and renamed, new names can be found in the `2020-09-14_1.64.15` change message

## OpenAPI Schema Changes
### 2020-09-14_1.77.1
- Fix extraneous field in enum that caused issue in code generation
- Added `asset_report_id` to the example for `/asset_report/relay/refresh`

### 2020-09-14_1.77.0
- Explicitly set `format: double` for non-integer numbers so generated fields prefer float64

### 2020-09-14_1.76.0
- Add three new endpoints for Assets: `/asset_report/relay/create`, `/asset_report/relay/get`, and `/asset_report/relay/rmeove`

### 2020-09-14_1.75.0
- Added `/asset_report/relay/refresh` endpoint

### 2020-09-14_1.74.0
- Add `recurring_transactions` to list of products

### 2020-09-14_1.73.0
- Add new endpoint for `/credit/bank_income/get`

### 2020-09-14_1.72.0
- Updated documentation URLs for all product endpoints. They can now be found
at `/docs/api/products/<product-name>/#endpoint` instead of `/docs/api/products/#endpoint`

### 2020-09-14_1.71.0
- internal changes

### 2020-09-14_1.70.0
- Remove deprecated `income_verification_id` from `/sandbox/income/fire_webhook`

### 2020-09-14_1.69.1
- Reorder processors enum

### 2020-09-14_1.69.0
- Added `/beta/transactions/v1/enhance` endpoint

### 2020-09-14_1.68.1
- Added `status` object to sample responses for `/institutions/get` and `institutions/search` endpoints

### 2020-09-14_1.68.0
- Mark `include_personal_finance_category_beta` property as deprecated.
- Add new argument `include_personal_finance_category` to TransactionsGetRequestOptions.
- Update docs for `/transactions/get` request and response, referencing personal_finance_category taxonomy csv file.

### 2020-09-14_1.67.1
- internal changes

### 2020-09-14_1.67.0
- Removed unused `/income/verification/summary/get` endpoint

### 2020-09-14_1.66.0
- Added Payment Consent endpoints

### 2020-09-14_1.65.0
- Removed unused `/income/verification/paystub/get` endpoint

### 2020-09-14_1.64.15
- De-anonymized enums:
  - `PaymentInitiationPaymentReverseResponse.properties.status` => `PaymentInitiationRefundStatus`
  - `PaymentInitiationPaymentCreateResponse.properties.status` => `PaymentInitiationPaymentCreateStatus`
  - `PaymentInitiationRefund.properties.status` => `PaymentInitiationRefundStatus`
  - `PaymentAmount.properties.currency` => `PaymentAmountCurrency`
  - `InvestmentTransaction.properties.type` => `InvestmentTransactionType`
  - `InvestmentTransaction.properties.subtype` => `InvestmentTransactionSubtype`
  - `TransferAuthorizationDecisionRationale.properties.code` => `TransferAuthorizationDecisionRationaleCode`
  - `TransferAuthorizationGuaranteeDecisionRationale.properties.code` => `TransferAuthorizationGuaranteeDecisionRationaleCode`
  - `TransferAuthorization.properties.decision` => `TransferAuthorizationDecision`
  - `TransferEventListRequest.properties.transfer_type` => `TransferEventListTransferType`
  - `BankTransferEventListRequest.properties.bank_transfer_type` => `BankTransferEventListBankTransferType`
  - `BankTransferEventListRequest.properties.direction` => `BankTransferEventListDirection`
  - `TransferIntentCreate.properties.status` => `TransferIntentStatus`
  - `TransferIntentGet.properties.status` => `TransferIntentStatus`
  - `TransferIntentGet.properties.authorization_decision` => `TransferIntentAuthorizationDecision`
- `IncomeVerificationPrecheckMilitaryInfo.properties.branch` is now a string field (previously enum)

### 2020-09-14_1.64.15
- Made `last_statement_balance` and `minimum_payment_amount` `nullable` for credit card liabilities schema to reflect existing API behavior.

### 2020-09-14_1.64.14
- Made `last_payment_amount` and `last_statement_issue_date` `nullable` for credit card liabilities schema to reflect existing API behavior.
- Fix transfers examples to reflect more consistent usage of `region` field.

# 14.12.1
- Updating to OAS 2020-09-14_1.64.13
- Fix issue where library did not correctly detect if app is a Rails app.

## OpenAPI Schema Changes
### 2020-09-14_1.64.13
- Deprecate `idempotency_key` parameter in transfer/create

### 2020-09-14_1.64.12
- Removed the unused `required_product_access` and `optional_product_access` parameters from `RequestedScopes`

### 2020-09-14_1.64.11
- Fix some examples that were not consistent with their schemas
- Add `adjustments` as an investments transaction type to make OpenAPI file consistent with values returned by the API
- Clarify description field for `marital_status` to reflect possible values

### 2020-09-14_1.64.10
- Updated the external docs URL for Bank Transfers sandbox endpoints

### 2020-09-14_1.64.9
- De-anonymized the object filters under `LinkTokenCreateRequestAccountSubtypes`, as anonymous objects aren't compatible with the generated CLibs.
- De-anonymized some misc. objects
  - `PaymentInitiationMetadata/properties/maximum_payment_amount`
  - `PaystubOverride/properties/employer`
  - `PaystubOverride/properties/employee`
  - `PaystubOverride/properties/employee/properties/address`
  - `LiabilitiesDefaultUpdateWebhook/properties/account_ids_with_updated_liabilities`

### 2020-09-14_1.64.8
- Updated the description of the historical_balances array

### 2020-09-14_1.64.7
- Add new possible enums for income verification earnings breakdown canonical description

### 2020-09-14_1.64.6
- Hid a few product enum values that are deprecated or no longer valid for certain request fields. This affects the documentation only.

### 2020-09-14_1.64.5
- Make guarantee fields required in Transfer endpoints

### 2020-09-14_1.64.4
- Updated description for `failure_reason` field in Transfer endpoints

### 2020-09-14_1.64.3
- Make `repayment_id` required in `/transfer/repayment/return/list` endpoint

### 2020-09-14_1.64.2
- Update description for legal name field in `BankTransferUser` 

### 2020-09-14_1.64.1
- Update descriptions for `/transfer/repayment/list` and `/transfer/repayment/return/list` endpoints

### 2020-09-14_1.64.0
- Remove `scheme_automatic_downgrade` from `/payment_initiation/payment/create`

### 2020-09-14_1.63.1
- Update description for `/sandbox/transfer/sweep/simulate` endpoint

### 2020-09-14_1.63.0
- Refactor account subtype enums for greater specificity. This has no changes to the API but is a major semver change for Python, Node, Go, and Java client library interfaces to the AccountSubtype object within account filtering contexts in `/link/token/create`. The `AccountSubtype` namespace in this context is now prefixed with the AccountType. (Example for Node: Old: `AccountSubtype.checking` New: `DepositoryAccountSubtype.checking`)

### 2020-09-14_1.62.7
- Update description for `datetime` and `authorized_datetime` fields in Transactions endpoints

### 2020-09-14_1.62.6
- Make `sweep_id` / `sweep_amount` fields on Transfer Event nullable

### 2020-09-14_1.62.6
- Set `institution_status` to be nullable in `InstitutionsGetResponse`

### 2020-09-14_1.62.5
- Update external docs URLs for Transfer and Bank Transfer endpoints
- Update description for `ach_return_code` field in Transfer endpoints

### 2020-09-14_1.62.4
- Add `join_date` to `/application/get` and `/item/application/list`
- Remove `created_at` from `/application/get`

### 2020-09-14_1.62.3
- Updated various description fields for Income

### 2020-09-14_1.62.2
- Add `employment` as an available product in Product array.

# 14.12.0
- Updating to OAS 2020-09-14_1.62.1

# 14.11.1
- Added a release step to the `Makefile` to purge previously released version of plaid-ruby in the current release.

# 14.11.0
- Updating to OAS 2020-09-14_1.61.0

# 14.10.0
- Updating to OAS 2020-09-14_1.58.1

# 14.9.0
- Updating to OAS 2020-09-14_1.54.2

# 14.8.0
- Updating to OAS 2020-09-14_1.46.1

# 14.7.0
- Updating to OAS 2020-09-14_1.44.0

# 14.6.0
- Updating to OAS 2020-09-14_1.40.3

# 14.5.0
- Updating to OAS 2020-09-14_1.36.4

# 14.4.0
- Updating to OAS 2020-09-14_1.34.1
- Fixed an issue with enums in this library. The library is supposed to be able to gracefully handle
    new enum values being returned from endpoints. Previously, if there were new enum values
    endpoint calls would fail.

# 14.3.0
Updating to OAS 2020-09-14_1.33.0.

# 14.2.0
Updating to OAS 2020-09-14_1.31.1.

# 14.1.0
Updating to OAS 2020-09-14_1.26.1.

# 14.0.0
The official release of the `plaid-ruby` generated library. Refer to the beta migration guide for tips on migrating from older version of the libraries.

This particular version is pinned to OpenAPI version `2020-09-14_1.20.6`.

# 14.0.0.beta.5
Generated from OAS version 2020-09-14_1.16.4. See full changelog [here](https://github.com/plaid/plaid-openapi/blob/master/CHANGELOG.md).

# 14.0.0.beta.4
See full changelog [here](https://github.com/plaid/plaid-openapi/blob/master/CHANGELOG.md).
- Remove validation for `maxProperties` due to generator bug.

# 14.0.0.beta.3
Type fixes, see full changelog [here](https://github.com/plaid/plaid-openapi/blob/master/CHANGELOG.md).

# 14.0.0.beta.1

This version represents a transition in how we maintain our external client libraries. We are now using an [API spec](https://github.com/plaid/plaid-openapi) written in `OpenAPI 3.0.0` and running our definition file through [OpenAPITool's `ruby` generator](https://github.com/OpenAPITools/openapi-generator).

The minimum required ruby version is 2.4.0.

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

# 13.2.0
- Add support for `options` to `/payment_initiation/payment/create`

# 13.1.0
- Add Standing Orders support to Payment Initiation

# 13.0.1
- Add `update_type` to `Item` model.

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
