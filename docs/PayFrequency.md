# Plaid::PayFrequency

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **value** | **String** | The frequency of the pay period. |  |
| **verification_status** | [**VerificationStatus**](VerificationStatus.md) |  |  |

## Example

```ruby
require 'plaid'

instance = Plaid::PayFrequency.new(
  value: null,
  verification_status: null
)
```

