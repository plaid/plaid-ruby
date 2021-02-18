# Plaid::PaymentAmount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **currency** | **String** | The ISO-4217 currency code of the payment amount |  |
| **value** | **Float** | The payment amount |  |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentAmount.new(
  currency: null,
  value: null
)
```

