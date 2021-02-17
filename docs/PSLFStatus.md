# Plaid::PSLFStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **estimated_eligibility_date** | **String** | The estimated date borrower will have completed 120 qualifying monthly payments. Returned in ISO 8601 format (YYYY-MM-DD). | [optional] |
| **payments_made** | **Float** | The number of qualifying payments that have been made. | [optional] |
| **payments_remaining** | **Float** | The number of qualifying payments remaining. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::PSLFStatus.new(
  estimated_eligibility_date: null,
  payments_made: null,
  payments_remaining: null
)
```

