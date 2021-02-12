# Plaid::CreditCardLiability

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The ID of the account that this liability belongs to. | [optional] |
| **aprs** | [**Array&lt;APR&gt;**](APR.md) | The various interest rates that apply to the account. |  |
| **is_overdue** | **Boolean** | true if a payment is currently overdue. Availability for this field is limited. | [optional] |
| **last_payment_amount** | **Float** | The amount of the last payment. |  |
| **last_payment_date** | **String** | The date of the last payment. Dates are returned in an ISO 8601 format (YYYY-MM-DD). Availability for this field is limited. |  |
| **last_statement_balance** | **Float** | The outstanding balance on the last statement. Availability for this field is limited. |  |
| **last_statement_issue_date** | **String** | The date of the last statement. Dates are returned in an ISO 8601 format (YYYY-MM-DD). |  |
| **minimum_payment_amount** | **Float** | The minimum payment due for the next billing cycle. |  |
| **next_payment_due_date** | **String** | The due date for the next payment. The due date is &#x60;null&#x60; if a payment is not expected. Dates are returned in an ISO 8601 format (YYYY-MM-DD). |  |

## Example

```ruby
require 'plaid'

instance = Plaid::CreditCardLiability.new(
  account_id: null,
  aprs: null,
  is_overdue: null,
  last_payment_amount: null,
  last_payment_date: null,
  last_statement_balance: null,
  last_statement_issue_date: null,
  minimum_payment_amount: null,
  next_payment_due_date: null
)
```

