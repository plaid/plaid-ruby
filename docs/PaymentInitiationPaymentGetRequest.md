# Plaid::PaymentInitiationPaymentGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **payment_id** | **String** | The &#x60;payment_id&#x60; returned from &#x60;/payment_initiation/payment/create&#x60;. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationPaymentGetRequest.new(
  client_id: null,
  secret: null,
  payment_id: null
)
```

