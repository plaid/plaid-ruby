# Plaid::ProcessorStripeBankAccountTokenCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **stripe_bank_account_token** | **String** | A token that can be sent to Stripe for use in making API calls to Plaid |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ProcessorStripeBankAccountTokenCreateResponse.new(
  stripe_bank_account_token: null,
  request_id: null
)
```

