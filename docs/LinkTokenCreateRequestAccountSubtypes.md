# Plaid::LinkTokenCreateRequestAccountSubtypes

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **depository** | [**LinkTokenCreateRequestAccountSubtypesDepository**](LinkTokenCreateRequestAccountSubtypesDepository.md) |  | [optional] |
| **credit** | [**LinkTokenCreateRequestAccountSubtypesCredit**](LinkTokenCreateRequestAccountSubtypesCredit.md) |  | [optional] |
| **loan** | [**LinkTokenCreateRequestAccountSubtypesLoan**](LinkTokenCreateRequestAccountSubtypesLoan.md) |  | [optional] |
| **investment** | [**LinkTokenCreateRequestAccountSubtypesInvestment**](LinkTokenCreateRequestAccountSubtypesInvestment.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::LinkTokenCreateRequestAccountSubtypes.new(
  depository: null,
  credit: null,
  loan: null,
  investment: null
)
```

