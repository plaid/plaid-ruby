# Plaid::ItemStatusInvestments

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **last_successful_update** | **String** | ISO 8601 timestamp of the last successful investments update for the Item. The status will update each time Plaid successfully connects with the institution, regardless of whether any new data is available in the update. | [optional] |
| **last_failed_update** | **String** | ISO 8601 timestamp of the last failed investments update for the Item. The status will update each time Plaid fails an attempt to connect with the institution, regardless of whether any new data is available in the update. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemStatusInvestments.new(
  last_successful_update: null,
  last_failed_update: null
)
```

