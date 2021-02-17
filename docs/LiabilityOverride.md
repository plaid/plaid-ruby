# Plaid::LiabilityOverride

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | The type of the liability object, either &#x60;credit&#x60; or &#x60;student&#x60;. |  |
| **purchase_apr** | **Float** | The purchase APR percentage value. For simplicity, this is the only interest rate used to calculate interest charges. Can only be set if &#x60;type&#x60; is &#x60;credit&#x60;. |  |
| **cash_apr** | **Float** | The cash APR percentage value. Can only be set if &#x60;type&#x60; is &#x60;credit&#x60;. |  |
| **balance_transfer_apr** | **Float** | The balance transfer APR percentage value. Can only be set if &#x60;type&#x60; is &#x60;credit&#x60;. Can only be set if &#x60;type&#x60; is &#x60;credit&#x60;. |  |
| **special_apr** | **Float** | The special APR percentage value. Can only be set if &#x60;type&#x60; is &#x60;credit&#x60;. |  |
| **last_payment_amount** | **Float** | Override the &#x60;last_payment_amount&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;credit&#x60;. |  |
| **last_statement_balance** | **Float** | Override the &#x60;last_statement_balance&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;credit&#x60;. |  |
| **minimum_payment_amount** | **Float** | Override the &#x60;minimum_payment_amount&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;credit&#x60;. |  |
| **is_overdue** | **Boolean** | Override the &#x60;is_overdue&#x60; field |  |
| **origination_date** | **String** | The date on which the loan was initially lent, in ISO 8601 (YYYY-MM-DD) format. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **principal** | **Float** | The original loan principal. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **nominal_apr** | **Float** | The interest rate on the loan as a percentage. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **interest_capitalization_grace_period_months** | **Float** | If set, interest capitalization begins at the given number of months after loan origination. By default interest is never capitalized. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **repayment_model** | [**StudentLoanRepaymentModel**](StudentLoanRepaymentModel.md) |  |  |
| **expected_payoff_date** | **String** | Override the &#x60;expected_payoff_date&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **guarantor** | **String** | Override the &#x60;guarantor&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **is_federal** | **Boolean** | Override the &#x60;is_federal&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **loan_name** | **String** | Override the &#x60;loan_name&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **loan_status** | **String** | Override the &#x60;loan_status&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **payment_reference_number** | **String** | Override the &#x60;payment_reference_number&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **pslf_status** | **String** | Override the &#x60;pslf_status&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **repayment_plan_description** | **String** | Override the &#x60;repayment_plan.description&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **repayment_plan_type** | **String** | Override the &#x60;repayment_plan.type&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. Possible values are: &#x60;\&quot;extended graduated\&quot;&#x60;, &#x60;\&quot;extended standard\&quot;&#x60;, &#x60;\&quot;graduated\&quot;&#x60;, &#x60;\&quot;income-contingent repayment\&quot;&#x60;, &#x60;\&quot;income-based repayment\&quot;&#x60;, &#x60;\&quot;interest only\&quot;&#x60;, &#x60;\&quot;other\&quot;&#x60;, &#x60;\&quot;pay as you earn\&quot;&#x60;, &#x60;\&quot;revised pay as you earn\&quot;&#x60;, or &#x60;\&quot;standard\&quot;&#x60;. |  |
| **sequence_number** | **String** | Override the &#x60;sequence_number&#x60; field. Can only be set if &#x60;type&#x60; is &#x60;student&#x60;. |  |
| **servicer_address** | [**Address**](Address.md) |  |  |

## Example

```ruby
require 'plaid'

instance = Plaid::LiabilityOverride.new(
  type: null,
  purchase_apr: null,
  cash_apr: null,
  balance_transfer_apr: null,
  special_apr: null,
  last_payment_amount: null,
  last_statement_balance: null,
  minimum_payment_amount: null,
  is_overdue: null,
  origination_date: null,
  principal: null,
  nominal_apr: null,
  interest_capitalization_grace_period_months: null,
  repayment_model: null,
  expected_payoff_date: null,
  guarantor: null,
  is_federal: null,
  loan_name: null,
  loan_status: null,
  payment_reference_number: null,
  pslf_status: null,
  repayment_plan_description: null,
  repayment_plan_type: null,
  sequence_number: null,
  servicer_address: null
)
```

