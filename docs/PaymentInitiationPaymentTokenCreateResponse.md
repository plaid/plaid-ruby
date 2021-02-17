# Plaid::PaymentInitiationPaymentTokenCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_token** | **String** | A &#x60;payment_token&#x60; that can be provided to Link initialization to enter the payment initiation flow |  |
| **payment_token_expiration_time** | **String** | The date and time at which the token will expire, in ISO 8601 format. A &#x60;payment_token&#x60; expires after 15 minutes. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationPaymentTokenCreateResponse.new(
  payment_token: null,
  payment_token_expiration_time: null,
  request_id: null
)
```

