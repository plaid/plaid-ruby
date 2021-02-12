# Plaid::PayPeriodDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **start_date** | **String** | The pay period start date, in ISO 8601 format: \&quot;yyyy-mm-dd\&quot;. | [optional] |
| **end_date** | **String** | The pay period end date, in ISO 8601 format: \&quot;yyyy-mm-dd\&quot;. | [optional] |
| **pay_day** | **String** | The date on which the paystub was issued, in ISO 8601 format (\&quot;yyyy-mm-dd\&quot;). | [optional] |
| **gross_earnings** | **Float** | Total earnings before tax. | [optional] |
| **check_amount** | **Float** | The net amount of the paycheck. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::PayPeriodDetails.new(
  start_date: null,
  end_date: null,
  pay_day: null,
  gross_earnings: null,
  check_amount: null
)
```

