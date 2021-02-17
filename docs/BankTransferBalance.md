# Plaid::BankTransferBalance

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **available** | **String** | The total available balance - the sum of all successful debit transfer amounts minus all credit transfer amounts. |  |
| **transactable** | **String** | The transactable balance shows the amount in your account that you are able to use for transfers, and is essentially your available balance minus your minimum balance. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferBalance.new(
  available: null,
  transactable: null
)
```

