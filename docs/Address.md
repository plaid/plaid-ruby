# Plaid::Address

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**AddressData**](AddressData.md) |  |  |
| **primary** | **Boolean** | When &#x60;true&#x60;, identifies the address as the primary address on an account. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::Address.new(
  data: null,
  primary: null
)
```

