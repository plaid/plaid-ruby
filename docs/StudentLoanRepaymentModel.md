# Plaid::StudentLoanRepaymentModel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | The only currently supported value for this field is &#x60;standard&#x60;. |  |
| **non_repayment_months** | **Float** | Configures the number of months before repayment starts. |  |
| **repayment_months** | **Float** | Configures the number of months of repayments before the loan is paid off. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::StudentLoanRepaymentModel.new(
  type: null,
  non_repayment_months: null,
  repayment_months: null
)
```

