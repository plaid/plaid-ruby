# Plaid::PaymentInitiationPaymentCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_id** | **String** | A unique ID identifying the payment |  |
| **status** | **String** | For a payment returned by this endpoint, there is only one possible value:  &#x60;PAYMENT_STATUS_INPUT_NEEDED&#x60;: The initial phase of the payment |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationPaymentCreateResponse.new(
  payment_id: null,
  status: null,
  request_id: null
)
```

