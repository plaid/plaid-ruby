# Plaid::IncomeBreakdown

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | The type of income. Possible values include &#x60;\&quot;regular\&quot;&#x60;, &#x60;\&quot;overtime\&quot;&#x60;, and &#x60;\&quot;bonus\&quot;&#x60;. | [optional] |
| **rate** | **Float** | The hourly rate at which the income is paid. | [optional] |
| **hours** | **Float** | The number of hours logged for this income for this pay period. | [optional] |
| **total** | **Float** | The total pay for this pay period. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::IncomeBreakdown.new(
  type: null,
  rate: null,
  hours: null,
  total: null
)
```

