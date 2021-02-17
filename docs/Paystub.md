# Plaid::Paystub

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **paystub_id** | **String** | The unique identifier for this paystub. |  |
| **account_id** | **String** | The account identifier for the account associated with this paystub. | [optional] |
| **employer** | [**Employer**](Employer.md) |  |  |
| **employee** | [**Employee**](Employee.md) |  |  |
| **pay_period_details** | [**PayPeriodDetails**](PayPeriodDetails.md) |  |  |
| **income_breakdown** | [**IncomeBreakdown**](IncomeBreakdown.md) |  |  |
| **ytd_earnings** | [**PaystubYTDDetails**](PaystubYTDDetails.md) |  |  |

## Example

```ruby
require 'plaid'

instance = Plaid::Paystub.new(
  paystub_id: null,
  account_id: null,
  employer: null,
  employee: null,
  pay_period_details: null,
  income_breakdown: null,
  ytd_earnings: null
)
```

