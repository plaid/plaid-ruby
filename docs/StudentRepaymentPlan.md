# Plaid::StudentRepaymentPlan

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | The description of the repayment plan as provided by the servicer. | [optional] |
| **type** | **String** | The type of the repayment plan. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::StudentRepaymentPlan.new(
  description: null,
  type: null
)
```

