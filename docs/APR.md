# Plaid::APR

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **apr_percentage** | **Float** | Annual Percentage Rate applied.  |  |
| **apr_type** | **String** | The type of balance to which the APR applies. |  |
| **balance_subject_to_apr** | **Float** | Amount of money that is subjected to the APR if a balance was carried beyond payment due date. How it is calculated can vary by card issuer. It is often calculated as an average daily balance. | [optional] |
| **interest_charge_amount** | **Float** | Amount of money charged due to interest from last statement. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::APR.new(
  apr_percentage: null,
  apr_type: null,
  balance_subject_to_apr: null,
  interest_charge_amount: null
)
```

