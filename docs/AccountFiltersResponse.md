# Plaid::AccountFiltersResponse

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

instance = Plaid::AccountFiltersResponse.new(
  depository: null,
  credit: null,
  loan: null,
  investment: null
)
```

