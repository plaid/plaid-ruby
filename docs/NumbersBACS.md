# Plaid::NumbersBACS

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The Plaid account ID associated with the account numbers |  |
| **account** | **String** | The BACS account number for the account |  |
| **sort_code** | **String** | The BACS sort code for the account |  |

## Example

```ruby
require 'plaid'

instance = Plaid::NumbersBACS.new(
  account_id: null,
  account: null,
  sort_code: null
)
```

