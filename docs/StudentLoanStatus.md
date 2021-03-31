# Plaid::StudentLoanStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **end_date** | **String** | The date until which the loan will be in its current status. Dates are returned in an ISO 8601 format (YYYY-MM-DD).  | [optional] |
| **type** | **String** | The status type of the student loan | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::StudentLoanStatus.new(
  end_date: null,
  type: null
)
```

