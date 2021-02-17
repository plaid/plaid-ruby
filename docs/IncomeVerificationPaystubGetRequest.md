# Plaid::IncomeVerificationPaystubGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **income_verification_id** | **String** | The ID of the verification for which to get paystub information. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::IncomeVerificationPaystubGetRequest.new(
  client_id: null,
  secret: null,
  income_verification_id: null
)
```

