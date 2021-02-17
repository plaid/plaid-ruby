# Plaid::PaystubYTDDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **gross_earnings** | **Float** | Year-to-date gross earnings. |  |
| **net_earnings** | **Float** | Year-to-date net (take home) earnings. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::PaystubYTDDetails.new(
  gross_earnings: null,
  net_earnings: null
)
```

