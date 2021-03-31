# Plaid::IncomeVerificationPaystubGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
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

