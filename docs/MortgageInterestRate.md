# Plaid::MortgageInterestRate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **percentage** | **Float** | Percentage value (interest rate of current mortgage, not APR) of interest payable on a loan. | [optional] |
| **type** | **String** | The type of interest charged (fixed or variable). | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::MortgageInterestRate.new(
  percentage: null,
  type: null
)
```

