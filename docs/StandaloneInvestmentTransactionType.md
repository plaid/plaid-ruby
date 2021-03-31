# Plaid::StandaloneInvestmentTransactionType

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **buy** | **String** | Buying an investment |  |
| **sell** | **String** | Selling an investment |  |
| **cancel** | **String** | A cancellation of a pending transaction |  |
| **cash** | **String** | Activity that modifies a cash position |  |
| **fee** | **String** | Fees on the account, e.g. commission, bookkeeping, options-related. |  |
| **transfer** | **String** | Activity which modifies a position, but not through buy/sell activity e.g. options exercise, portfolio transfer |  |

## Example

```ruby
require 'plaid'

instance = Plaid::StandaloneInvestmentTransactionType.new(
  buy: null,
  sell: null,
  cancel: null,
  cash: null,
  fee: null,
  transfer: null
)
```

