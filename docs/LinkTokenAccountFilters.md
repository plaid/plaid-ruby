# Plaid::LinkTokenAccountFilters

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **depository** | [**DepositoryFilter**](DepositoryFilter.md) |  | [optional] |
| **credit** | [**CreditFilter**](CreditFilter.md) |  | [optional] |
| **loan** | [**LoanFilter**](LoanFilter.md) |  | [optional] |
| **investment** | [**InvestmentFilter**](InvestmentFilter.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::LinkTokenAccountFilters.new(
  depository: null,
  credit: null,
  loan: null,
  investment: null
)
```

