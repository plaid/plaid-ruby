# Plaid::StudentLoan

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The ID of the account that this liability belongs to. | [optional] |
| **account_number** | **String** | The account number of the loan. For some institutions, this may be a masked version of the number (e.g., the last 4 digits instead of the entire number). | [optional] |
| **disbursement_dates** | **Array&lt;String&gt;** | The dates on which loaned funds were disbursed or will be disbursed. These are often in the past. Dates are returned in an ISO 8601 format (YYYY-MM-DD). | [optional] |
| **expected_payoff_date** | **String** | The date when the student loan is expected to be paid off. Availability for this field is limited. Dates are returned in an ISO 8601 format (YYYY-MM-DD). | [optional] |
| **guarantor** | **String** | The guarantor of the student loan. | [optional] |
| **interest_rate_percentage** | **Float** | The interest rate on the loan as a percentage. |  |
| **is_overdue** | **Boolean** | &#x60;true&#x60; if a payment is currently overdue. Availability for this field is limited. | [optional] |
| **last_payment_amount** | **Float** | The amount of the last payment. | [optional] |
| **last_payment_date** | **String** | The date of the last payment. Dates are returned in an ISO 8601 format (YYYY-MM-DD). | [optional] |
| **last_statement_balance** | **Float** | The outstanding balance on the last statement. This field could also be interpreted as the next payment due. Availability for this field is limited.  | [optional] |
| **last_statement_issue_date** | **String** | The date of the last statement. Dates are returned in an ISO 8601 format (YYYY-MM-DD). | [optional] |
| **loan_name** | **String** | The type of loan, e.g., \&quot;Consolidation Loans\&quot;. | [optional] |
| **loan_status** | [**StudentLoanStatus**](StudentLoanStatus.md) |  | [optional] |
| **minimum_payment_amount** | **Float** | The minimum payment due for the next billing cycle. There are some exceptions: Some institutions require a minimum payment across all loans associated with an account number. Our API presents that same minimum payment amount on each loan. The institutions that do this are: Great Lakes ( &#x60;ins_116861&#x60;), Firstmark (&#x60;ins_116295&#x60;), Commonbond Firstmark Services (&#x60;ins_116950&#x60;), Nelnet (&#x60;ins_116528&#x60;), EdFinancial Services (&#x60;ins_116304&#x60;), Granite State (&#x60;ins_116308&#x60;), and Oklahoma Student Loan Authority (&#x60;ins_116945&#x60;). Firstmark (&#x60;ins_116295&#x60; ) will display as $0 if there is an autopay program in effect. | [optional] |
| **next_payment_due_date** | **String** | The due date for the next payment. The due date is &#x60;null&#x60; if a payment is not expected. A payment is not expected if &#x60;loan_status.type&#x60; is &#x60;deferment&#x60;, &#x60;in_school&#x60;, &#x60;consolidated&#x60;, &#x60;paid in full&#x60;, or &#x60;transferred&#x60;. Dates are returned in an ISO 8601 format (YYYY-MM-DD). | [optional] |
| **origination_date** | **String** | The date on which the loan was initially lent. Dates are returned in an ISO 8601 format (YYYY-MM-DD).  | [optional] |
| **origination_principal_amount** | **Float** | The original principal balance of the loan. | [optional] |
| **outstanding_interest_amount** | **Float** | The total dollar amount of the accrued interest balance. For Sallie Mae ( &#x60;ins_116944&#x60;), this amount is included in the current balance of the loan, so this field will return as &#x60;null&#x60;. | [optional] |
| **payment_reference_number** | **String** | The relevant account number that should be used to reference this loan for payments. In the majority of cases, &#x60;payment_reference_number&#x60; will match a&#x60;ccount_number,&#x60; but in some institutions, such as Great Lakes (&#x60;ins_116861&#x60;), it will be different. | [optional] |
| **pslf_status** | [**PSLFStatus**](PSLFStatus.md) |  | [optional] |
| **repayment_plan** | [**StudentRepaymentPlan**](StudentRepaymentPlan.md) |  | [optional] |
| **sequence_number** | **String** | The sequence number of the student loan. Heartland ECSI (&#x60;ins_116948&#x60;) does not make this field available. | [optional] |
| **servicer_address** | [**ServicerAddressData**](ServicerAddressData.md) |  | [optional] |
| **ytd_interest_paid** | **Float** | The year to date (YTD) interest paid. Availability for this field is limited. | [optional] |
| **ytd_principal_paid** | **Float** | The year to date (YTD) principal paid. Availability for this field is limited. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::StudentLoan.new(
  account_id: null,
  account_number: null,
  disbursement_dates: null,
  expected_payoff_date: null,
  guarantor: null,
  interest_rate_percentage: null,
  is_overdue: null,
  last_payment_amount: null,
  last_payment_date: null,
  last_statement_balance: null,
  last_statement_issue_date: null,
  loan_name: null,
  loan_status: null,
  minimum_payment_amount: null,
  next_payment_due_date: null,
  origination_date: null,
  origination_principal_amount: null,
  outstanding_interest_amount: null,
  payment_reference_number: null,
  pslf_status: null,
  repayment_plan: null,
  sequence_number: null,
  servicer_address: null,
  ytd_interest_paid: null,
  ytd_principal_paid: null
)
```
