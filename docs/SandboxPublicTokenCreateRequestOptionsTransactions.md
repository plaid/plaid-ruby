# Plaid::SandboxPublicTokenCreateRequestOptionsTransactions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **String** | The earliest date for which to fetch transaction history. Dates should be formatted as YYYY-MM-DD. | [optional] |
| **end_date** | **String** | The most recent date for which to fetch transaction history. Dates should be formatted as YYYY-MM-DD. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::SandboxPublicTokenCreateRequestOptionsTransactions.new(
  start_date: null,
  end_date: null
)
```

