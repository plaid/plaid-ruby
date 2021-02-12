# Plaid::NumbersEFT

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The Plaid account ID associated with the account numbers |  |
| **account** | **String** | The EFT account number for the account |  |
| **institution** | **String** | The EFT institution number for the account |  |
| **branch** | **String** | The EFT branch number for the account |  |

## Example

```ruby
require 'plaid'

instance = Plaid::NumbersEFT.new(
  account_id: null,
  account: null,
  institution: null,
  branch: null
)
```

