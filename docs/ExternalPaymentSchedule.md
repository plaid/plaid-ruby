# Plaid::ExternalPaymentSchedule

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **interval** | **String** | The frequency interval of the payment. Valid values are &#x60;\&quot;WEEKLY\&quot;&#x60; or &#x60;\&quot;MONTHLY\&quot;&#x60;. |  |
| **interval_execution_day** | **Float** | The day of the interval on which to schedule the payment.  If the payment interval is weekly, &#x60;interval_execution_day&#x60; should be an integer from 1 (Monday) to 7 (Sunday).  If the payment interval is monthly, &#x60;interval_execution_day&#x60; should be an integer indicating which day of the month to make the payment on. Integers from 1 to 28 can be used to make a payment on that day of the month. Negative integers from -1 to -5 can be used to make a payment relative to the end of the month. To make a payment on the last day of the month, use -1; to make the payment on the second-to-last day, use -2, and so on. |  |
| **start_date** | **String** | A date in ISO 8601 format (YYYY-MM-DD). Standing order payments will begin on the first &#x60;interval_execution_day&#x60; on or after the &#x60;start_date&#x60;.  If the first &#x60;interval_execution_day&#x60; on or after the start date is also the same day that &#x60;/payment_initiation/payment/create&#x60; was called, the bank *may* make the first payment on that day, but it is not guaranteed to do so. |  |
| **end_date** | **String** | A date in ISO 8601 format (YYYY-MM-DD). Standing order payments will end on the last &#x60;interval_execution_day&#x60; on or before the &#x60;end_date&#x60;.  If the only &#x60;interval_execution_day&#x60; between the start date and the end date (inclusive) is also the same day that &#x60;/payment_initiation/payment/create&#x60; was called, the bank *may* make a payment on that day, but it is not guaranteed to do so. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::ExternalPaymentSchedule.new(
  interval: null,
  interval_execution_day: null,
  start_date: null,
  end_date: null
)
```

