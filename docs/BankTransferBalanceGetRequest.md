# Plaid::BankTransferBalanceGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **origination_account_id** | **String** | If multiple origination accounts are available, &#x60;origination_account_id&#x60; must be used to specify the account for which balance will be returned. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferBalanceGetRequest.new(
  client_id: null,
  secret: null,
  origination_account_id: null
)
```

