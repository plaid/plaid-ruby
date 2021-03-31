# Plaid::IncomeSummary

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **employer_name** | [**EmployerIncomeSummaryFieldString**](EmployerIncomeSummaryFieldString.md) |  | [optional] |
| **employee_name** | [**EmployeeIncomeSummaryFieldString**](EmployeeIncomeSummaryFieldString.md) |  | [optional] |
| **ytd_gross_income** | [**YTDGrossIncomeSummaryFieldNumber**](YTDGrossIncomeSummaryFieldNumber.md) |  | [optional] |
| **ytd_net_income** | [**YTDNetIncomeSummaryFieldNumber**](YTDNetIncomeSummaryFieldNumber.md) |  | [optional] |
| **pay_frequency** | [**PayFrequency**](PayFrequency.md) |  | [optional] |
| **projected_wage** | [**ProjectedIncomeSummaryFieldNumber**](ProjectedIncomeSummaryFieldNumber.md) |  | [optional] |
| **verified_transaction** | [**TransactionData**](TransactionData.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::IncomeSummary.new(
  employer_name: null,
  employee_name: null,
  ytd_gross_income: null,
  ytd_net_income: null,
  pay_frequency: null,
  projected_wage: null,
  verified_transaction: null
)
```

