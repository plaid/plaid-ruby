See full changelog for the OpenAPI schema (OAS) [here](https://github.com/plaid/plaid-openapi/blob/master/CHANGELOG.md).

# 18.1.0
- Updating to OAS 2020-09-14_1.345.1

## OpenAPI Schema Changes
### 2020-09-14_1.345.1
- Update `/transactions/enrich` field `is_recurring` field to be optional.bool

### 2020-09-14_1.345.0
- Fix bug in which `environment` field was incorrectly missing from Assets webhooks.

### 2020-09-14_1.344.0
- Add recurrence and is_recurring fields to `/transactions/enrich`

### 2020-09-14_1.343.6

- Update incorrect required fields for `/watchlist_screening/entity/update`

### 2020-09-14_1.343.5
- Update `owners` description for `/credit/bank_income/get` and `/beta/credit/v1/bank_employment/get`

### 2020-09-14_1.343.4
- Make comment about `webhook` field in `/link/token/create` request more explicit

### 2020-09-14_1.343.3
- Make VOA in /credit/freddie_mac/reports/get optional

### 2020-09-14_1.343.2
- Update `warnings` description for `/credit/bank_income/get` and `/beta/credit/v1/bank_employment/get`

### 2020-09-14_1.343.1
- Updated Asset endpoint descriptions related to Verification of Employment

# 18.0.0
- Updating to OAS 2020-09-14_1.343.0

## OpenAPI Schema Changes
### 2020-09-14_1.343.0
- Add new `warnings` field to the response of `/signal/evaluate`

### 2020-09-14_1.342.0
- Add `report_type` to assets webhook docs
- Make `add_ons` public in assets docs for /asset_report/create
- Make `fast_report` public in assets docs for /asset_report/get

### 2020-09-14_1.341.0
- Add `risk_check` attribute to all Identity Verification responses

### 2020-09-14_1.340.1
- Update examples for `entity_id` in `/transactions/enrich`

### 2020-09-14_1.340.0
- Create `options` in `/link_delivery/create`
- Create `recipient` within `options` field
- Move `communication_methods` from top level to `recipient`
- Add `first_name` in `recipient`

### 2020-09-14_1.339.0
- Add `callback_type` to link delivery webhooks

### 2020-09-14_1.338.2
- Make `communication_methods` optional in `/link_delivery/create`

### 2020-09-14_1.338.1
- Remove beta description from `/transactions/enrich` endpoint docs

### 2020-09-14_1.338.0
- Add `transaction_id` to `/payment-initiation/#payment_status_update`
- Add `payment_id` and `wallet_id` to `/virtual-accounts/#wallet_transaction_status_update`

### 2020-09-14_1.337.4
- Modify documentation for credit categories in the `/asset_report/get` based on GTM feedback

### 2020-09-14_1.337.3
- Update description for the `address` field in `/payment_initiation/recipient/create`.

### 2020-09-14_1.337.2
- Add annually recurring frequency to `/transactions/recurring/get`

### 2020-09-14_1.337.1
- Make documentation for credit categories in the `/asset_report/get` endpoint public

### 2020-09-14_1.337.0
- Add bank employment results to `/credit/sessions/get`

### 2020-09-14_1.336.1
- Add `signal` to Products array.

### 2020-09-14_1.336.0
- Add options to `/credit/payroll_income/refresh` to allow item-level refresh

### 2020-09-14_1.335.2
- Updated `amount.value` description field with new minimum requirement for `/payment_initiation/payment/reverse` and `/wallet/transaction/execute`

### 2020-09-14_1.335.1
- Add 'employment' as an available product in the request to `/partner/customer/create`

### 2020-09-14_1.335.0
- [Breaking] Renamed Identity Verification UserName objects to IdentityVerificationRequestUserName and IdentityVerificationResponseUserName

# 17.4.0
- Updating to OAS 2020-09-14_1.334.0

## OpenAPI Schema Changes
### 2020-09-14_1.334.0
- Add "entity_id" field to /transactions/enrich

### 2020-09-14_1.333.0
- Add "add_ons" field to asset_report/create

### 2020-09-14_1.332.0
- [Breaking] Remove `/wallet/transaction/list` endpoint
  - [Note] Determined that `/wallet/transaction/list` is unused

### 2020-09-14_1.331.0
Add `LinkDeliveryCallbackWebhook`, `LinkUserDeliveryStatusWebhook` for Link Delivery.

### 2020-09-14_1.330.0
- [Breaking] Remove `options.wallet_id` field in `/payment_initiation/payment/create` and `/payment_initiation/consent/create` request.
  - [Note] Determined that this field is unused.

### 2020-09-14_1.229.2
- Undeprecated the `legal_name` field in the `/link/token/create` request.

### 2020-09-14_1.229.1
- Add `income_verification` as a supported product in the request for `/partner/customer/create`.

### 2020-09-14_1.229.0
- Add `network` field to `/transfer/intent/create` request.
- Updated `reference` minLength for `/wallet/transaction/execute` request and `/payment_initiation/payment/reverse` request.

### 2020-09-14_1.228.0
- Add `access_tokens` and `item_ids` to `/link_delivery/get` response

### 2020-09-14_1.227.0
- Add optional `persistent_account_id` field to account responses

### 2020-09-14_1.226.0
- Add `employment` fields to `/link/token/create`

### 2020-09-14_1.225.0
- Add `redacted_at` field in Identity Verification response and Documentary Verification Document component
- Update `original_front` field in Identity Verification Document Images to be nullable in redacted Identity Verification sessions

### 2020-09-14_1.224.0
- Add `earliest_deposit_date` and change `last_deposit_date` to `latest_deposit_date` for `/beta/credit/v1/bank_employment/get`

### 2020-09-14_1.223.0
- Add `redirect_uris` to `/partner/customer/create` request.

### 2020-09-14_1.222.0
- Add `wallet_id` field to `/wallet/transaction/get` and `/wallet/transaction/list` responses

### 2020-09-14_1.221.0
- Update `link_delivery/get` to remove `public_tokens` from the response

### 2020-09-14_1.220.0
- Update `link_delivery/create` to accept `communication_methods` and deprecate `delivery_method` and `delivery_destination`

### 2020-09-14_1.219.1
- Fix the `refund_id` example.
- Update address objects to reflect that in rare instances, `city` may be `null`.

### 2020-09-14_1.219.0
- Add partner webhook event type

### 2020-09-14_1.218.1
- Mark `phone_number_verified_time` and `email_address_verified_time` as deprecated, since it is no longer required to provide these fields to enable to enable the Returning User Experience.

### 2020-09-14_1.218.1
- Introduce `expected_settlement_date` field in the Transfer object

### 2020-09-14_1.218.0
- Add `/beta/credit/v1/bank_employment/get` endpoint

### 2020-09-14_1.217.0
- Add `updated` field to `/credit/audit_copy_token/update` response
- Add `SchemaVersion` to VOE and VOA schemas for `/credit/freddie_mac/reports/get`

### 2020-09-14_1.216.0
- Introduce `funding_account_id` field in the Transfer API
- Remove deprecated `origination_account_id` field from the Transfer documentation

### 2020-09-14_1.215.2
- Use more strict validation for `payment_id` and `recipient_id` fields in API

### 2020-09-14_1.215.1
- Use more strict validation for payment `consent_id` field in API

### 2020-09-14_1.215.0
- Add `status` to Wallet schema

# 17.3.0
- Updating to OAS 2020-09-14_1.214.0

## OpenAPI Schema Changes
### 2020-09-14_1.214.0
- Add `/credit/freddie_mac/reports/get` endpoint

### 2020-09-14_1.213.1
- Reflect that `days_requested` field in Bank Income Verification object in `/link/token/create` request is required when using Bank Income.
- Reflect that `is_update_mode` field in Bank Income Verification object in `/link/token/create` request defaults to `false`.
- Update description to reflect that Document Income object in `/link/token/create` request is not required, even when using Document Income. 

### 2020-09-14_1.213.0
- Update `PartnerEndCustomerStatus` enum values.

### 2020-09-14_1.212.0
- Add `/credit/audit_copy_token/update` endpoint
- Add `report_type` to AssetReportCreateRequest

### 2020-09-14_1.211.1

- Fix `US_MBS` list code which was mistakenly documented as `US_MBC` for screening individuals with Monitor
- Document `TR_CMB` list code for screening individuals with Monitor
- Document `IZ_WBK` list code for screening individuals and entities with Monitor

### 2020-09-14_1.211.0
- Add `/partner/customer/oauth_institutions/get` endpoint.

### 2020-09-14_1.210.8
- Update example response for `/credit/bank_income/get`

### 2020-09-14_1.210.7
- Documentation updates for Investments APIs and Bank Transfer APIs.

### 2020-09-14_1.210.6
- Add validation on `originator_client_id` and `redirect_uri` for `/transfer/originator/create` and `transfer/originator/get` request

### 2020-09-14_1.210.5
- Add `company_name` to TransferOriginatorGetResponse

# 17.2.0
- Updating to OAS 2020-09-14_1.210.4

## OpenAPI Schema Changes
### 2020-09-14_1.210.4
- Add `recurring_transfer_id` to Transfer

### 2020-09-14_1.210.3
- Make `id_numbers` field hidden in `/user/create` request 

### 2020-09-14_1.210.2
- Make `transfer_ids` required in RecurringTransfer

### 2020-09-14_1.210.1
- Change the `/transactions/enrich` `options.include_legacy_categories` field to `options.include_legacy_category`
- Make documentation for the `/transactions/enrich` `options.include_legacy_category` request field visible
- Make documentation for the `/transactions/enrich` `legacy_category` and `legacy_category_id` response fields visible
- Add `direction` to required fields for `ClientProvidedTransaction`

### 2020-09-14_1.210.0
- Add `/transfer/capabilities/get` endpoint to fetch RTP eligibility for a linked plaid item

### 2020-09-14_1.209.2
- Renamed the `NullableRecurringTransfer` type to `RecurringTransferNullable` type

### 2020-09-14_1.209.1
Add `nullable` property to `date_of_birth`, `phone_number_verified_time`, and `email_address_verified_time` fields within `LinkTokenCreateRequestUser` to resolve undesireable client library behavior in certain languages.

### 2020-09-14_1.209.0
- add `NullableRecurringTransfer` field
- replace `RecurringTransfer` with `NullableRecurringTransfer` for `TransferRecurringCreateResponse`
- and `Decision` in required fields for `TransferRecurringCreateResponse`
- add required fields for `TransferRecurringSchedule`

### 2020-09-14_1.208.0
- Add `total_amounts` field to `/credit/bank_income/get` response
- Deprecate `amount`, `iso_currency_code`, and `unofficial_currency_code` at top levels in `/credit/bank_income/get` response

### 2020-09-14_1.207.0
- Add `id_numbers` field to `/user/create` request

### 2020-09-14_1.206.11
- Add `RECURRING_NEW_TRANSFER` webhook event.
- Add `RECURRING_TRANSFER_SKIPPED` webhook event.
- Add `RECURRING_CANCELLED` webhook event.

### 2020-09-14_1.206.10
- make `idempotency_key` field for `/transfer/recurring/create` non-nullable

### 2020-09-14_1.206.9
- Add `description` field for `RecurringTransfer` object
- Make `TransferRecurringStatus` non-nullable

### 2020-09-14_1.206.8
- Make all mentions of relay tokens lowercase

### 2020-09-14_1.206.7
- Updated external URLs for Credit Relay endpoints, and marked them as beta in the summary

### 2020-09-14_1.206.6
- Add more enums values to `pay_rate` field in `/credit/payroll_income/get` response
- Add `pay_basis` field to `/credit/payroll_income/get`

### 2020-09-14_1.206.5
- Updated Credit Relay Token descriptions

### 2020-09-14_1.206.4
- Add `FUNDS_SWEEP` as a `type` enum for the `WalletTransaction` object

### 2020-09-14_1.206.3
- Make `test_clock_id` non-nullable in `test_clock`.

### 2020-09-14_1.206.2
- Update `CounterpartyType` to rename `delivery_marketplace` to `marketplace`
- Update `CounterpartyType` to add `payment_terminal`

### 2020-09-14_1.206.1
- Update the `transactions/enrich` transaction description example to match the request.

### 2020-09-14_1.206.0
- Add `/sandbox/transfer/test_clock/list` for recurring transfer
- rm `decision` and `decision_rationale` from `RecurringTransfer`
- add `decision` and `decision_rationale` in `TransferRecurringCreateResponse`
- rename `frozen_timestamp` to `virtual_time`
- not requiring `client_id` and `secret` for recurring transfer APIs

### 2020-09-14_1.205.9
- Use a nested `options` field for optional request params to `transactions/enrich`
- Make nullable fields required for `transactions/enrich`

### 2020-09-14_1.205.8
- Update supported payment scheme options for `/payment_initiation/payment/create`
–	Update description of `/payment_initiation/recipient/create` to mention non-Eurozone countries.
–	Update `/payment_initiation/payment/create` mentioning new currencies and non-Eurozone markets.
–	Removed `CHF` and `CZK` from the list of supported currencies.

### 2020-09-14_1.205.7
- Add website and logo_url to the `Counterparty` object for the Enrich product.
- Update descriptions for logo_url field in `Counterparty`, `TransactionCounterparty`, `Enrichments` and `Enhancements`.

### 2020-09-14_1.205.6
- Update field descriptions and response examples for `transactions/enrich`

### 2020-09-14_1.205.5
- Add support for optional request parameters in /transactions/enrich
- Add `location` field to `ClientProvidedTransaction` object
- Add `mcc` field to `ClientProvidedTransaction` object
- Add `date_posted` field to `ClientProvidedTransaction` object

### 2020-09-14_1.205.4
- Document partial refunds
- Update description for `/payment_initiation/payment/reverse` endpoint
- Update description for `/payment_initiation/payment/get` endpoint

# 17.1.0
- Updating to OAS 2020-09-14_1.205.3

## OpenAPI Schema Changes
### 2020-09-14_1.205.3
- Update description for `/signal/evaluate` endpoint

### 2020-09-14_1.205.2
- Update response examples, descriptions, and formatting for `/transactions/enrich` endpoint

### 2020-09-14_1.205.1
- Update descriptions for `CUSIP` and `ISIN` fields in the investments `Security` type to reflect CGS license requirements

### 2020-09-14_1.205.0
- Add `/transactions/enrich` endpoint, the EA version of `/beta/transactions/v1/enhance`.

### 2020-09-14_1.204.0
- Remove `/income/verification/refresh` endpoint

### 2020-09-14_1.203.0
- Add 7 brand new recurring transfer APIs
- Add `/transfer/recurring/create`
- Add `/transfer/recurring/list`
- Add `/transfer/recurring/get`
- Add `/transfer/recurring/cancel`
- Add `/sandbox/transfer/test_clock/create`
- Add `/sandbox/transfer/test_clock/advance`
- Add `/sandbox/transfer/test_clock/get`

### 2020-09-14_1.202.6
- IdentityMatchResponse `PhoneNumberMatchScore` and `EmailAddressMatchScore` use `score` instead of `scores`

### 2020-09-14_1.202.5
- Add `/partner/customer/remove` endpoint

### 2020-09-14_1.202.4
- Internal changes

### 2020-09-14_1.202.3
- New Transfer API routes for hosted onboarding of TPS end-customers

### 2020-09-14_1.202.0
- Add `refunds` field to `Transfer` object
- Add `refund_id` field to `TransferEvent` object
- Fix typo for `transfer/get` and `transfer/refund/get`

### 2020-09-14_1.201.0
- Add support for partial refunds
- Add `amount` field to `/payment_initiation/payment/reverse` request
- Add `amount_refunded` field to `/payment_initiation/payment/get` and `/payment_initiation/payment/list` responses

### 2020-09-14_1.200.0
- Add `risk_summary` and `page_number` to `/beta/credit/payroll_income/risk_signals/get`

### 2020-09-14_1.199.0
- Renamed `/wallet/transactions/list` into `/wallet/transaction/list` as endpoint

### 2020-09-14_1.198.8
- `/transfer/authorization/create` and `/transfer/create` may not return `account_id` in response.

### 2020-09-14_1.198.7
- Add `SYNC_UPDATES_AVAILABLE` support to `/sandbox/item/fire_webhook`

### 2020-09-14_1.198.6
- Make `ProductStatus` object nullable to reflect Sandbox-specific behavior.
- Clarify documentation for `SYNC_UPDATES_AVAILABLE` webhook.

### 2020-09-14_1.198.5
- Internal changes

### 2020-09-14_1.198.4
- Add `deleted_at` to `/payment_profile/get` response.

### 2020-09-14_1.198.3
- Change `start_date` to `start_time` for `/wallet/transaction/list` response.

### 2020-09-14_1.198.2
- Update list of available products for `/partner/customer/create`.

### 2020-09-14_1.198.1
- Add `institution_name` and `institution_id` fields to `/credit/payroll_income/get` response.

### 2020-09-14_1.198.0
- Add `options.start_date` and `options.end_date` to `/wallet/transaction/list` endpoint.
- Add `last_status_update` and `payment_id` field to `WalletTransaction`.
- Add `transaction_id` field to `PaymentInitiationPayment`

### 2020-09-14_1.197.6
- Add `originator_client_id` to Transfer API endpoints

### 2020-09-14_1.197.5
- Deprecate `origination_account_id` from `/transfer/authorization/create` endpoint.

### 2020-09-14_1.197.4
- Add `asset_under_management` field to `PartnerCustomerCreateRequest`.

# 17.0.0
- Updating to OAS 2020-09-14_1.205.3

## OpenAPI Schema Changes
### 2020-09-14_1.205.3
- Update description for `/signal/evaluate` endpoint

### 2020-09-14_1.205.2
- Update response examples, descriptions, and formatting for `/transactions/enrich` endpoint

### 2020-09-14_1.205.1
- Update descriptions for `CUSIP` and `ISIN` fields in the investments `Security` type to reflect CGS license requirements

### 2020-09-14_1.205.0
- Add `/transactions/enrich` endpoint, the EA version of `/beta/transactions/v1/enhance`.

### 2020-09-14_1.204.0
- Remove `/income/verification/refresh` endpoint

### 2020-09-14_1.203.0
- Add 7 brand new recurring transfer APIs
- Add `/transfer/recurring/create`
- Add `/transfer/recurring/list`
- Add `/transfer/recurring/get`
- Add `/transfer/recurring/cancel`
- Add `/sandbox/transfer/test_clock/create`
- Add `/sandbox/transfer/test_clock/advance`
- Add `/sandbox/transfer/test_clock/get`

### 2020-09-14_1.202.6
- IdentityMatchResponse `PhoneNumberMatchScore` and `EmailAddressMatchScore` use `score` instead of `scores`

### 2020-09-14_1.202.5
- Add `/partner/customer/remove` endpoint

### 2020-09-14_1.202.4
- Internal changes

### 2020-09-14_1.202.3
- New Transfer API routes for hosted onboarding of TPS end-customers

### 2020-09-14_1.202.0
- Add `refunds` field to `Transfer` object
- Add `refund_id` field to `TransferEvent` object
- Fix typo for `transfer/get` and `transfer/refund/get`

### 2020-09-14_1.201.0
- Add support for partial refunds
- Add `amount` field to `/payment_initiation/payment/reverse` request
- Add `amount_refunded` field to `/payment_initiation/payment/get` and `/payment_initiation/payment/list` responses

### 2020-09-14_1.200.0
- Add `risk_summary` and `page_number` to `/beta/credit/payroll_income/risk_signals/get`

### 2020-09-14_1.199.0
- Renamed `/wallet/transactions/list` into `/wallet/transaction/list` as endpoint

### 2020-09-14_1.198.8
- `/transfer/authorization/create` and `/transfer/create` may not return `account_id` in response.

### 2020-09-14_1.198.7
- Add `SYNC_UPDATES_AVAILABLE` support to `/sandbox/item/fire_webhook`

### 2020-09-14_1.198.6
- Make `ProductStatus` object nullable to reflect Sandbox-specific behavior.
- Clarify documentation for `SYNC_UPDATES_AVAILABLE` webhook.

### 2020-09-14_1.198.5
- Internal changes

### 2020-09-14_1.198.4
- Add `deleted_at` to `/payment_profile/get` response.

### 2020-09-14_1.198.3
- Change `start_date` to `start_time` for `/wallet/transaction/list` response.

### 2020-09-14_1.198.2
- Update list of available products for `/partner/customer/create`.

### 2020-09-14_1.198.1
- Add `institution_name` and `institution_id` fields to `/credit/payroll_income/get` response.

### 2020-09-14_1.198.0
- Add `options.start_date` and `options.end_date` to `/wallet/transaction/list` endpoint.
- Add `last_status_update` and `payment_id` field to `WalletTransaction`.
- Add `transaction_id` field to `PaymentInitiationPayment`

### 2020-09-14_1.197.6
- Add `originator_client_id` to Transfer API endpoints

### 2020-09-14_1.197.5
- Deprecate `origination_account_id` from `/transfer/authorization/create` endpoint.

### 2020-09-14_1.197.4
- Add `asset_under_management` field to `PartnerCustomerCreateRequest`.

# 17.0.0
- Updating to OAS 2020-09-14_1.197.3

## Breaking changes
- Move from Ruby 2.4.0 to Ruby 3, incorporating [#440](https://github.com/plaid/plaid-ruby/pull/440)
- Consolidate usages of `Error` into `PlaidError`
- Rename `LOGIN_REQUIRED` from transfer authorizations `decision_rationale` to `ITEM_LOGIN_REQUIRED`
- Update `IdentityVerificationRequestUser.date_of_birth` to be required to match the existing behavior of the API.

## OpenAPI Schema Changes
### 2020-09-14_1.197.3
- Update supported `CountryCode`'s in `link/token/create` docs.

### 2020-09-14_1.197.2
- ach_class optional
- add rtp network option

### 2020-09-14_1.197.1
- Add newly supported languages for Link

### 2020-09-14_1.197.0
- Add `PAYMENT_PROFILE_LOGIN_REQUIRED` to transfer authorization `decision_rationale.code`.

### 2020-09-14_1.196.3
- Add `institution_name` field to `payroll_income_result` of `/credit/sessions/get`

### 2020-09-14_1.196.2
- Add requirements for `logo` in `PartnerCustomerCreateRequest`.

### 2020-09-14_1.196.2
- Deprecate webhook status `VERIFICATION_STATUS_PENDING_APPROVAL` in `income_verification` apis.

### 2020-09-14_1.196.1
- Add a note in the description of `/transfer/authorization/create`

### 2020-09-14_1.196.0
- Added endpoint `/sandbox/payment_profile/reset_login` 

### 2020-09-14_1.195.0
- Consolidate usages of `Error` into `PlaidError`
- Add a `PlaidErrorType` enum

### 2020-09-14_1.194.2
- Fix typo for `income_verification` in `/sandbox/public_token/create` options

### 2020-09-14_1.194.1
- Update field descriptions in `/partner/customer/*` responses.
- Make `PartnerEndCustomerWithSecrets` extend `PartnerEndCustomer`.
- Fix documentation links in `/partner/customer/*` endpoints.

### 2020-09-14_1.194.0
- Add `/partner/customer/enable` endpoint

### 2020-09-14_1.193.0
- Rename `LOGIN_REQUIRED` from transfer authorizations `decision_rationale` to `ITEM_LOGIN_REQUIRED`

### 2020-09-14_1.192.3
- Add `/fdx/notifications` endpoint.

### 2020-09-14_1.192.2
- Add `USER_REPORTED_NO_INCOME` to CreditSessionBankIncomeStatus

### 2020-09-14_1.192.1
- Update description for `payment_profile_token` field

### 2020-09-14_1.192.0
- Add `income_verfication` field to `/sandbox/public_token/create`

### 2020-09-14_1.191.1
- Add `document_income_result` field to `credit/sessions/get`

### 2020-09-14_1.191.0
- Remove `payment_profile_id` from `/payment_profile/*`, `/transfer/authorization/create`, and `/transfer/create` endpoints and replace with `payment_profile_token`

### 2020-09-14_1.190.0
- Removed auditor_id from /credit/audit_copy/token/create

### 2020-09-14_1.189.0
- Add length boundary for the `client_user_id` field in `user/create`

### 2020-09-14_1.188.0
- Add `SchemaVersion` field to Freddie Mac Verification of Assets Schema

### 2020-09-14_1.187.0
- Add `non-custodial wallet` to account subtypes supported for investments
- Add `trade` investment transaction subtype as a subtype of `transfer` investment transaction type

### 2020-09-14_1.186.2
- Add `errors` field to `credit/sessions/get`

### 2020-09-14_1.186.1
- Add `payroll_income_result` field to `credit/sessions/get`

### 2020-09-14_1.186.0

- Update `IdentityVerificationRequestUser.date_of_birth` to be required to match the existing behavior of the API.

### 2020-09-14_1.185.0

- Add support for `USER_INPUT_TIMEOUT` as a value for `force_error` in the sandbox custom user schema.

### 2020-09-14_1.184.0

- Make `payment_id` not required in `/link/token/create` under the `payment_initiation` field.

### 2020-09-14_1.183.0

- Add `beacon_session_id` field in req of /transfer/authorization/create endpoint.

### 2020-09-14_1.182.0
- Add `/link/oauth/correlation_id/exchange` endpoint.

# 16.0.0
- Updating to OAS 2020-09-14_1.181.1

## OpenAPI Schema Changes
### 2020-09-14_1.181.1
- Update `report_tokens` in `/credit/relay/create` endpoint request to be a list of strings instead a list of objects

### 2020-09-14_1.181.0

- Add `credit/sessions/get` endpoint

### 2020-09-14_1.180.0

- Remove `Date` and `DateNullable` types in identity_verification and monitor endpoints. Replace with `ISO8601Date` and `ISO8601DateNullable`
    instead.

### 2020-09-14_1.179.0

- Remove `idempotency_key` field from resp of /transfer/authorization/create endpoint.

### 2020-09-14_1.178.2

- Change `institution_price_as_of` field on the Holdings object to nullable

### 2020-09-14_1.178.1

- Add `AUTHORISING` wallet transaction status

### 2020-09-14_1.178.0

- Add `/partner/customer/get` endpoint.
- Add `status` to the response for `/partner/customer/create`.

### 2020-09-14_1.177.4

- Add `settled` as a valid event type for `/sandbox/transfer/simulate`

### 2020-09-14_1.177.3
- Replace `ASSET_TRANSACTION_DESCRIPTION` with `ASSET_TRANSACTION_DESCRIPTON` in Freddie Mac
  Asset Report

### 2020-09-14_1.177.2
- Add `ownership_type` to Asset Report account object, to reflect actual API behavior.
- Update and clarify docs, including update to reflect new Transfers cutoff times.

### 2020-09-14_1.177.1
- Add `settled` as a possible Transfer status and `swept_settled` as a possible Transfer sweep status
- Add `settled` and `swept_settled` as new Transfer event types
- Add `settled` field to Transfer sweep object
- Add `standard_return_window` and `unauthorized_return_window` fields to Transfer object

### 2020-09-14_1.177.0

- Add `options` and `days_to_included` to `AssetReportGetRequest`

### 2020-09-14_1.176.2
- Add `recipient_id` field examples to the `/wallet/create`, `/wallet/get`, and `/wallet/list` responses

### 2020-09-14_1.176.1
- Set `employment_report_token` field in the `/credit/employment/get` endpoint to be not required

### 2020-09-14_1.176.0

- Add `mask` to the `meta` field of overridden accounts in the sandbox custom user configuration object schema.

### 2020-09-14_1.175.0

- Remove `MiddleName` and add `VALIDATION_SOURCES` to Freddie Mac Asset Report

### 2020-09-14_1.174.1

- Add `adyen` as processor partner

### 2020-09-14_1.174.0

- Add `environment` as an attribute to all webhook payloads

### 2020-09-14_1.173.0

- Add `idempotency_key` field in req/resp of /transfer/authorization/create endpoint.

### 2020-09-14_1.172.1

- Removed `/asset_report/relay/` endpoints

### 2020-09-14_1.172.0

- Add payroll institution to /credit/income/precheck endpoint.

### 2020-09-14_1.171.0

- Add `recipient_id` to the `/wallet/create`, `/wallet/get`, and `/wallet/list` responses

### 2020-09-14_1.170.1

- Fix that `client_id` and `secret` were erroneously marked as `required` for the request bodies of some endpoints. (These fields can be sent in the header and thus are not required in bodies).

### 2020-09-14_1.170.0

- Add `with_guarantee` field in request of `/transfer/authorization/create`

### 2020-09-14_1.169.0

- Add `issuing_region` as a field in the extracted data to documentary verification documents `/identity_verification/create`, `/identity_verification/get`, `/identity_verification/list` and `/identity_verification/retry` responses.

### 2020-09-14_1.168.2

- Add `bacs`/`iban` recommendation for `/payment_initiation/recipient/create`

### 2020-09-14_1.168.1

- Update descriptions for `/payment_profile/create`, `/payment_profile/get` and `/payment_profile/remove`

### 2020-09-14_1.168.0

-- Add `counterparties` to `/beta/transactions/v1/enhance` response

### 2020-09-14_1.167.1

- Added `MICRODEPOSIT_ERROR` which was returned by the API but missing from the error type enum.
- Various fixes to typos and descriptions

### 2020-09-14_1.167.0

- Add authorization code `MIGRATED_ACCOUNT_ITEM` for Items created via `/transfer/migrate_account` endpoint

### 2020-09-14_1.166.0

- Add `updated_at` field to Payroll Item entries in `/credit/payroll_income/get`

### 2020-09-14_1.165.3

- removed LoanRoleType, ReportIdentifierType, and ReportDateTime fields from `/credit/asset_report/freddie_mac/get`

### 2020-09-14_1.165.2

- Remove deprecated reverse_swept enum value from documentation

### 2020-09-14_1.165.1

- Update example response for the `wallet/list` endpoint

### 2020-09-14_1.165.0

- Add details for `IdentityMatchResponse` for `/identity/match` endpoint

### 2020-09-14_1.164.10

- Update descriptions for `HOLDINGS: DEFAULT_UPDATE` and `INVESTMENT_TRANSACTIONS: DEFAULT_UPDATE` webhooks

### 2020-09-14_1.164.9

- Removed report_type from the request to `/credit/asset_report/freddie_mae/get`

### 2020-09-14_1.164.8

- Add documentation for credit categories in the `/asset_report/get` endpoint

### 2020-09-14_1.164.7

- Remove redundant parameters from the `/transfer/create` endpoint from docs and mark them as deprecated

### 2020-09-14_1.164.6

- Add the following new currencies for the `/payment_initiation` API route group: PLN, SEK, DKK, NOK, CHF, CZK

### 2020-09-14_1.164.5

- Update description for `/payment_initiation/payment/reverse` to indicate that this endpoint only works with virtual accounts
- Update description for `/wallet/transaction/execute` to indicate that settlement will take seconds to days

### 2020-09-14_1.164.4

- Remove verification fields from `/credit/payroll_income/get` and `/income/verification/paystubs/get`

### 2020-09-14_1.164.3

- Remove pull_id field from `/credit/payroll_income/get`

### 2020-09-14_1.164.2

- Update external documentation links for the `/wallet/` API route group
- Update `/payment_initiation/payment/reverse` description to cover which payments are eligible for refunds
- Update `/payment_initiation/payment/create` reference field description to indicate that references should be unique and will be adjusted automatically
- Update `PaymentInitiationPaymentStatus` description to indicate that payments may take seconds to days to settle depending on the payment rail used
- Update `WalletTransactionStatus` description to indicate that transactions may take seconds to days to settle depending on the payment rail used

### 2020-09-14_1.164.1

- Make `is_savings_or_money_market_account` field in `SignalEvaluateCoreAttributes` nullable

### 2020-09-14_1.164.0

- Add new endpoint `/credit/asset_report/freddie_mac`

### 2020-09-14_1.163.0

- Add `/link_delivery/create` endpoint
- Add `/link_delivery/get` endpoint

### 2020-09-14_1.162.2

- Fix minimum and maximum values in `/signal/evaluate` scores

### 2020-09-14_1.162.1

- Make holdings `institution_price_as_of` non-nullable

### 2020-09-14_1.162.0

- Add `WalletTransactionStatusUpdateWebhook` object
- Update `WalletTransactionStatus` to include an additional `SETTLED` enum
- Update `PaymentInitiationPaymentStatus` to include an additional `PAYMENT_STATUS_SETTLED` enum

# 15.11.0
- Updating to OAS 2020-09-14_1.161.5

## OpenAPI Schema Changes
### 2020-09-14_1.161.5

- Reverts the changes made in 2020-09-14_1.157.0

### 2020-09-14_1.161.4

- Update description for webhook `USER_PERMISSION_REVOKED`

### 2020-09-14_1.161.3
 
- Bug fix: Put quotes around the '529' account type to prevent generated client libraries from treating it as an integer.
- Add `RECURRING_TRANSACTIONS_UPDATE` to description of sandbox webhook testing endpoint

### 2020-09-14_1.161.2

- Change the Item schema to refer to `PlaidError` rather than `Error` to avoid namespace conflicts in client libraries.

### 2020-09-14_1.161.1

- Add required fields back to AssetReport schema

### 2020-09-14_1.161.0
- Remove `access_token` request parameter from `/beta/partner/v1/customers/create`

### 2020-09-14_1.160.0

- Add `user` fields to the `/link/token/create` `user` object.

### 2020-09-14_1.159.0

- Add `RECURRING_TRANSACTIONS_UPDATE` webhook specification
- Fix typo in `/sandbox/item/fire_webhook` description

### 2020-09-14_1.158.1

- Add x-plaid-validation for Credit Relay Tokens

### 2020-09-14_1.158.0

- Add `address` and `id_number` fields to the `/link/token/create` `user` object.

### 2020-09-14_1.157.0

- Update and add schemas referred by `AssetReportGetResponse`

### 2020-09-14_1.156.0

- Add `payment_profile_id` to `/transfer/authorization/create` and `/transfer/create`
- Make `access_token` and `account_id` optional in `/transfer/authorization/create` and `/transfer/create`

### 2020-09-14_1.155.0

- Add `payment_profile_id` as a field under `transfer` for `/link/token/create`

### 2020-09-14_1.154.0

- Create `/credit/bank_income/pdf/get` to allow customers to retrieve the bank income product as a PDF

### 2020-09-14_1.153.1
-- Add `personal_finance_category_icon_url` to `/beta/transactions/v1/enhance` response

### 2020-09-14_1.153.0
-- Add new endpoint `/beta/partner/v1/customers/create`

### 2020-09-14_1.152.0
- Add `form1099s` as part of the `credit/payroll_income/get` response.
- Add `Credit1099` object and corresponding subtypes.

### 2020-09-14_1.151.1
- Update required fields list for guaranteed ACH customers

### 2020-09-14_1.151.0
- Mark `verification` field under `paystubs` object in `/credit/payroll_income/get` as deprecated

### 2020-09-14_1.150.0
- Make `user_present` under `/transfer/authorization/create` nullable

### 2020-09-14_1.149.1
- Update fields description for guaranteed ACH customers

### 2020-09-14_1.149.0

- Add `gave_consent` as a field under `identity_verification` for `/link/token/create`
- Remove `identity_verification.consent`, which is deprecated, from documentation for `/link/token/create`

### 2020-09-14_1.148.0

- Add `user_present` a an optional field under `/transfer/authorization/create`, update fields description for guaranteed ACH customers

### 2020-09-14_1.147.1

- Remove deprecated `reversed` status from Transfer schema
- Remove deprecated `reverse_swept` status from Transfer Event schema

### 2020-09-14_1.147.0

- Add new endpoints `/credit/relay/get`, `/credit/relay/refresh` and `/credit/relay/remove`

# 15.10.0
- Updating to OAS 2020-09-14_1.146.0

## OpenAPI Schema Changes
### 2020-09-14_1.146.0

- make item_logins field not required

### 2020-09-14_1.145.0

- Make changes to IdentityMatchRequest to support options data

### 2020-09-14_1.144.0

- Remove unsupported error_code (`PRODUCTS_NOT_SUPPORTED`) for the `force_error` config in Sandbox

### 2020-09-14_1.143.0

- Make changes to support crypto in Investments product

### 2020-09-14_1.142.0

- Add new endpoints `/payment_profile/get` and `/payment_profile/remove`

### 2020-09-14_1.141.1

- Bug fix: add `identity_verification` to `Products` array

### 2020-09-14_1.141.0

- Add a new endpoint `/payment_profile/create`

### 2020-09-14_1.140.1

- Add `stated_income_sources` as a field under `income_verification` for `/link/token/create`

### 2020-09-14_1.140.0

- Add `bin` as a field under `institution_metadata` for `/link/token/create`

### 2020-09-14_1.139.0

- Add `international` IBAN numbers to `WalletNumbers` field in `/wallet/get` and `/wallet/list` responses.
- Wrap the `iban` field in the `WalletTransactionCounterpartyNumbers` under new field `international`.

### 2020-09-14_1.138.0

- Add new `identity/match` endpoint, and `IdentityMatchRequest` and `IdentityMatchResponse`

### 2020-09-14_1.137.1

- Update comment for the `recipient.name` field with recommendation to avoid long strings and special characters.

### 2020-09-14_1.137.0

- Reverts the changes made in 2020-09-14_1.135.0. ProductAccess and AccountProductAccess once again have all fields explicitly defined.

### 2020-09-14_1.136.0

- Add `products` in `asset_report/create` endpoint.

### 2020-09-14_1.135.0

- Convert ProductAccess and AccountProductAccess to optional.Map

### 2020-09-14_1.134.0

- Rename `merchant_website` and `merchant_logo_url` in `/beta/transactions/v1/enhance` to `website` and `logo_url`

### 2020-09-14_1.133.0

- Update `/credit/payroll_income/get` response to have a `pull_id` instead of an `income_report_token` and add `pull_id` to `/credit/employment/get` response

### 2020-09-14_1.132.1

- Made several fields nullable for `/signal/evaluate`

### 2020-09-14_1.132.0

- Add `/credit/audit_copy_token/remove` to invalidate Audit Copy tokens

# 15.9.0
- Updating to OAS 2020-09-14_1.131.3

## OpenAPI Schema Changes
### 2020-09-14_1.131.3
- Update external URL for `/transfer/migrate_account` endpoint

### 2020-09-14_1.131.2
- Add `TRANSFER_LIMIT_REACHED` to enum `TransferAuthorizationDecisionRationaleCode`

### 2020-09-14_1.131.1
- Update `/payment_initiation/consent/*` external docs URLs

### 2020-09-14_1.131.0
- Add `iban` to `counterparty`'s `numbers` field in `/wallet/transaction/execute`

### 2020-09-14_1.130.0
- Update description of `/user/create` to make it more clear what would happen when a client calls the user creation endpoint with the same client_user_id multiple times.

### 2020-09-14_1.129.0
- Add `signal_description` for each risk signal in `/beta/credit/payroll_income/risk_signals/get`
- Change `DocumentRiskSignalInstitutionMetadata` to be nullable

### 2020-09-14_1.128.6
- Fix category rules formatting

### 2020-09-14_1.128.5
- Change description in `UserCustomPassword` to reflect that only top level fields are optional not all fields

### 2020-09-14_1.128.4
- Move Category Rules description to `include_personal_finance_category` flag

# 15.8.0
- Updating to OAS 2020-09-14_1.128.4

## OpenAPI Schema Changes
### 2020-09-14_1.128.4
- Add `identity_verification` as a new optional parameter for `/link/token/create`

### 2020-09-14_1.128.3
- Add category rules beta to `personal_finance_category` field description
in `/transactions/get`

# 15.7.0
- Updating to OAS 2020-09-14_1.128.2

## OpenAPI Schema Changes
### 2020-09-14_1.128.2
- Update description of `/investments/transactions/get` endpoint
- Update description of `cost_basis` field 

### 2020-09-14_1.128.1
- Add `merchant_website` and `merchant_logo_url` to `/beta/transactions/v1/enhance` response

### 2020-09-14_1.128.0
- Add `auth_type_select_enabled`, `automated_microdeposits_enabled`, `instant_match_enabled`, and `same_day_microdeposits_enabled` to `/link/token/create`
- Marked `flow_type` parameter as deprecated

### 2020-09-14_1.127.0
- Add `consent_id` filter to `/payment_initiation/payment/list`
- Add `consent_id` to `/link/token/create`

### 2020-09-14_1.126.0

- Added `/credit/relay/create` endpoint

### 2020-09-14_1.125.0

- Add `accounts` object to `/credit/payroll_income/get` response

### 2020-09-14_1.124.0
- Added `include_fast_report` in `asset_report/create` endpoint. Added `fast_report` in `asset_report/get` endpoint

### 2020-09-14_1.123.1
- Removed `reversed` and `reverse_swept` from possible event_type values in TransferEventListRequest docs

### 2020-09-14_1.123.0

- Change `tokens` to `report_tokens` in `/credit/audit_copy_token/create` request

### 2020-09-14_1.122.0

- Add `request_id` to all Identity Verification and Monitor responses

### 2020-09-14_1.121.2
- Added sample user_id to INCOME_VERIFICATION webhook

### 2020-09-14_1.121.1
- Pre-release API refinements to Monitor and Flow endpoints

# 15.6.0
- Updating to OAS 2020-09-14_1.121.0

## OpenAPI Schema Changes
### 2020-09-14_1.121.0
- Add TimestampNullable type

### 2020-09-14_1.120.0
- Removed `Uploaded`, `Created` and `APPROVAL_STATUS_APPROVED` enum strings from `PayrollItemStatus` field.

### 2020-09-14_1.119.0
- Add `returned` to TransferStatus enum
- Add `return_swept` to TransferSweepStatus enum
- Add `returned` and `return_swept` to TransferEventType enum

### 2020-09-14_1.118.0
- Added `employee_type` and `last_paystub_date` to `/credit/employment/get` response

### 2020-09-14_1.117.1
- Make `/payment_initiation/consent/create` API more strict

### 2020-09-14_1.117.0
- Add `/credit/audit_copy_token/create` endpoint

### 2020-09-14_1.116.0
- Add `/wallet/list` endpoint

# 15.5.0
- Updating to OAS 2020-09-14_1.115.2

## OpenAPI Schema Changes
### 2020-09-14_1.115.2
- Update description fields to fix formatting errors
- Reflect that `error.suggested_action` is `nullable`

### 2020-09-14_1.115.1
- Update OpenAPI spec

### 2020-09-14_1.115.0
- Added `income_report_token` to `/credit/payroll_income/get` response

### 2020-09-14_1.114.2
- Add `/wallet/create` endpoint

### 2020-09-14_1.114.1
- Add beta `additional_consented_products` field to `/link/token/create`

### 2020-09-14_1.113.1
- Updated `/transactions/recurring/get` description

### 2020-09-14_1.113.0
- Add webhooks for new Monitor and Identity Verification products

### 2020-09-14_1.112.0
- Add endpoints for new Monitor and Identity Verification products

### 2020-09-14_1.111.15
- Remove `emi_recipient_id` from Payment Initiation Recipient

### 2020-09-14_1.111.14
- Add optional `iban` and `bacs` fields to `options` in the `/payment_initiation/consent/create` request

### 2020-09-14_1.111.13
- Updated `/transactions/sync` description

### 2020-09-14_1.111.12
- Add more accurate enum documentations to `/transactions/recurring/get` API doc

### 2020-09-14_1.111.11
- Additional documentation for `/transactions/sync`

### 2020-09-14_1.111.9
- Remove deprecated field `createdAt` from `/application/get` response

### 2020-09-14_1.111.8
- Add field validation to `BankTransferDirection`

### 2020-09-14_1.111.7
- Remove deprecated field `createdAt` from `/application/get` response

### 2020-09-14_1.111.6
- Add external doc link to `transactions/recurring/get`

### 2020-09-14_1.111.5
- Updating the API doc for Recurring Transactions

### 2020-09-14_1.111.4
- Add `DisplayName` in `/application/get` response

### 2020-09-14_1.111.3
- Updated sample responses for all Transfer endpoints

### 2020-09-14_1.111.2
- Changing `beta/transactions/rules/` routes to `beta/transactions/rules/v1`

### 2020-09-14_1.111.1
- Fixing `InsitututionMetadata` typo to `InstitutionMetadata` in private `/beta/credit/payroll_income/risk_signals/get`endpoint response

### 2020-09-14_1.111.0
- Added `require_guarantee`, `guarantee_decision`, and `guarantee_decision_rationale` to `/transfer/intent` in order to support Guarantee when using Transfer UI.

### 2020-09-14_1.110.2
- Add additional supported `type` enums in `WalletTransaction`.

### 2020-09-14_1.110.1
- Add Additional History billing information for /asset_report/create.

### 2020-09-14_1.110.0
- Add `user_id` to income verification webhook payload

### 2020-09-14_1.109.1
- Make `consent_id` field nullable in `PaymentInitiationPayment`.

### 2020-09-14_1.109.0
- Replace `initiated_refunds` with `refund_ids` in the `/payment_initiation/payment/get` and `/payment_initiation/payment/list` responses

### 2020-09-14_1.108.0
- Added `/beta/credit/payroll_income/risk_signals/get` endpoint (currently private)

### 2020-09-14_1.107.4
- Remove unsupported ACH classes from `bank_transfer/` and `transfer/` endpoints.

### 2020-09-14_1.107.3
- Add `enable_multiple_items` parameter for bank income.

### 2020-09-14_1.107.2
- Fix typo in `institution_name` parameter for credit endpoints.

### 2020-09-14_1.107.0
- Added `reference` and `idempotency_key` fields to the `payment_initiation/payment/reverse` request.

### 2020-09-14_1.106.0
- Added `is_update_mode` to `income_verification` in the `/link/token/create` body

### 2020-09-14_1.105.2
- Consolidate item schemas

# 15.4.0
- Updating to OAS 2020-09-14_1.105.1
- Expose Faraday::Connection object for additional configuration options

## OpenAPI Schema Changes
### 2020-09-14_1.105.1
- Removed `client_id` and `secret` as required fields from `/transfer/intent/{get,create}` to match actual API behavior.

### 2020-09-14_1.105.0
- Add `/credit/payroll_income/refresh` endpoint

### 2020-09-14_1.104.0
- Added `/signal/prepare`

### 2020-09-14_1.103.0
- Add `/transactions/recurring/deactivate` endpoint

### 2020-09-14_1.102.0
- Added `/watchlist_screening/individual/list` (currently private)
- Added `/watchlist_screening/individual/create` (currently private)
- Added `/watchlist_screening/individual/get` (currently private)
- Added `/watchlist_screening/individual/update` (currently private)
- Added `/watchlist_screening/individual/history/list` (currently private)
- Added `/watchlist_screening/individual/review/list` (currently private)
- Added `/watchlist_screening/individual/review/create` (currently private)
- Added `/watchlist_screening/individual/hit/list` (currently private)
- Added `/watchlist_screening/entity/list` (currently private)
- Added `/watchlist_screening/entity/create` (currently private)
- Added `/watchlist_screening/entity/get` (currently private)
- Added `/watchlist_screening/entity/update` (currently private)
- Added `/watchlist_screening/entity/history/list` (currently private)
- Added `/watchlist_screening/entity/hit/list` (currently private)
- Added `/watchlist_screening/entity/review/list` (currently private)
- Added `/watchlist_screening/entity/review/create` (currently private)
- Added `/watchlist_screening/individual/program/list` (currently private)
- Added `/watchlist_screening/individual/program/get` (currently private)
- Added `/watchlist_screening/entity/program/list` (currently private)
- Added `/watchlist_screening/entity/program/get` (currently private)
- Added `/dashboard_user/list` (currently private)
- Added `/dashboard_user/get` (currently private)
- Added `/identity_verification/list` (currently private)
- Added `/identity_verification/get` (currently private)
- Added `/identity_verification/retry` (currently private)
- Modified `/identity_verification/create` (currently private)

### 2020-09-14_1.101.0
- Add endpoint for `/credit/bank_income/refresh`

### 2020-09-14_1.100.0
- Add `include_original_description`, `include_personal_finance_category` options to `/transactions/sync` request.

### 2020-09-14_1.99.0
- API changes for /credit/employment/get

### 2020-09-14_1.98.1
- Add `gusto` as processor partner

### 2020-09-14_1.98.0
- Add `user_token` as a request parameter for `/sandbox/public_token/create`

### 2020-09-14_1.97.1
- Remove `auth`, `transactions_updates`, `investments_updates`, and `identity` as required fields from Item status to match actual API behavior.

# 15.3.0
- Updating to OAS 2020-09-14_1.97.0

## OpenAPI Schema Changes
### 2020-09-14_1.97.0
- [Beta] Rename some `Credit` refs that were preventing client library generation from completing successfully

### 2020-09-14_1.96.0
- remove unused `payroll_income_id` from `/credit/payroll_income/get` field
- add status object to items in `/credit/payroll_income/get` response body

### 2020-09-14_1.95.1
- Add `TransferEventsUpdateWebhook` schema

### 2020-09-14_1.95.0
- Add `institution_data` parameter to `/link/token/create`

### 2020-09-14_1.94.2
- Tidy up YAML

### 2020-09-14_1.94.1
- Add `highnote` processor to `/processor/token/create`

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
