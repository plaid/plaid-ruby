# Plaid::LinkTokenCreateRequestPaymentInitiation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_id** | **String** | The &#x60;payment_id&#x60; provided by the &#x60;/payment_initiation/payment/create&#x60; endpoint. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::LinkTokenCreateRequestPaymentInitiation.new(
  payment_id: null
)
```

