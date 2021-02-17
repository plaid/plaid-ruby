# Plaid::Amount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **currency** | **String** | The ISO-4217 currency code of the payment. For standing orders, &#x60;\&quot;GBP\&quot;&#x60; must be used. |  |
| **value** | **Float** | The amount of the payment. Must contain at most two digits of precision e.g. &#x60;1.23&#x60;. Minimum accepted value is &#x60;1&#x60;. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::Amount.new(
  currency: null,
  value: null
)
```

