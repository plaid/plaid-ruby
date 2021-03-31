# Plaid::ProductStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **status** | **String** | &#x60;HEALTHY&#x60;: the majority of requests are successful &#x60;DEGRADED&#x60;: only some requests are successful &#x60;DOWN&#x60;: all requests are failing |  |
| **last_status_change** | **String** | ISO 8601 formatted timestamp of the last status change for the institution. |  |
| **breakdown** | [**ProductStatusBreakdown**](ProductStatusBreakdown.md) |  |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ProductStatus.new(
  status: null,
  last_status_change: null,
  breakdown: null
)
```

