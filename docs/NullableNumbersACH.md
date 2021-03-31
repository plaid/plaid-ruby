# Plaid::NullableNumbersACH

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The Plaid account ID associated with the account numbers |  |
| **account** | **String** | The ACH account number for the account |  |
| **routing** | **String** | The ACH routing number for the account |  |
| **wire_routing** | **String** | The wire transfer routing number for the account, if available | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::NullableNumbersACH.new(
  account_id: null,
  account: null,
  routing: null,
  wire_routing: null
)
```

