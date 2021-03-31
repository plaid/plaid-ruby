# Plaid::PaymentInitiationPaymentCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **recipient_id** | **String** | The ID of the recipient the payment is for. |  |
| **reference** | **String** | A reference for the payment. This must be an alphanumeric string with at most 18 characters and must not contain any special characters (since not all institutions support them). |  |
| **amount** | [**Amount**](Amount.md) |  |  |
| **schedule** | [**ExternalPaymentSchedule**](ExternalPaymentSchedule.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationPaymentCreateRequest.new(
  client_id: null,
  secret: null,
  recipient_id: null,
  reference: null,
  amount: null,
  schedule: null
)
```

