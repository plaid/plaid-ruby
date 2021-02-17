# Plaid::RecipientBACS

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account** | **String** | The account number of the account. Maximum of 10 characters. | [optional] |
| **sort_code** | **String** | The 6-character sort code of the account. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::RecipientBACS.new(
  account: null,
  sort_code: null
)
```

