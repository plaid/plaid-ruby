# Plaid::PaymentStatusUpdateWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;PAYMENT_INITIATION&#x60; |  |
| **webhook_code** | **String** | &#x60;PAYMENT_STATUS_UPDATE&#x60; |  |
| **payment_id** | **String** | The &#x60;payment_id&#x60; for the payment being updated |  |
| **new_payment_status** | **String** | The new status of the payment.  &#x60;PAYMENT_STATUS_INPUT_NEEDED&#x60;: This is the initial state of all payments. It indicates that the payment is waiting on user input to continue processing. A payment may re-enter this state later on if further input is needed.  &#x60;PAYMENT_STATUS_PROCESSING&#x60;: The payment is currently being processed. The payment will automatically exit this state when processing is complete.  &#x60;PAYMENT_STATUS_INITIATED&#x60;: The payment has been successfully initiated and is considered complete.  &#x60;PAYMENT_STATUS_COMPLETED&#x60;: Indicates that the standing order has been successfully established. This state is only used for standing orders.  &#x60;PAYMENT_STATUS_INSUFFICIENT_FUNDS&#x60;: The payment has failed due to insufficient funds.  &#x60;PAYMENT_STATUS_FAILED&#x60;: The payment has failed to be initiated. This error is retryable once the root cause is resolved.  &#x60;PAYMENT_STATUS_BLOCKED&#x60;: The payment has been blocked. This is a retryable error.  &#x60;PAYMENT_STATUS_UNKNOWN&#x60;: The payment status is unknown. |  |
| **old_payment_status** | **String** | The previous status of the payment.  &#x60;PAYMENT_STATUS_INPUT_NEEDED&#x60;: This is the initial state of all payments. It indicates that the payment is waiting on user input to continue processing. A payment may re-enter this state later on if further input is needed.  &#x60;PAYMENT_STATUS_PROCESSING&#x60;: The payment is currently being processed. The payment will automatically exit this state when processing is complete.  &#x60;PAYMENT_STATUS_INITIATED&#x60;: The payment has been successfully initiated and is considered complete.  &#x60;PAYMENT_STATUS_COMPLETED&#x60;: Indicates that the standing order has been successfully established. This state is only used for standing orders.  &#x60;PAYMENT_STATUS_INSUFFICIENT_FUNDS&#x60;: The payment has failed due to insufficient funds.  &#x60;PAYMENT_STATUS_FAILED&#x60;: The payment has failed to be initiated. This error is retryable once the root cause is resolved.  &#x60;PAYMENT_STATUS_BLOCKED&#x60;: The payment has been blocked. This is a retryable error.  &#x60;PAYMENT_STATUS_UNKNOWN&#x60;: The payment status is unknown. |  |
| **original_reference** | **String** | The original value of the reference when creating the payment. | [optional] |
| **adjusted_reference** | **String** | The value of the reference sent to the bank after adjustment to pass bank validation rules. | [optional] |
| **original_start_date** | **Date** | The original value of the &#x60;start_date&#x60; provided during the creation of a standing order. If the payment is not a standing order, this field will be &#x60;null&#x60;. | [optional] |
| **adjusted_start_date** | **Date** | The start date sent to the bank after adjusting for holidays or weekends.  Will be provided in ISO 8601 format (YYYY-MM-DD). If the start date did not require adjustment, or if the payment is not a standing order, this field will be &#x60;null&#x60;. | [optional] |
| **timestamp** | **String** | The timestamp of the update, in ISO 8601 format, e.g. &#x60;\&quot;2017-09-14T14:42:19.350Z\&quot;&#x60; |  |
| **error** | [**Error**](Error.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentStatusUpdateWebhook.new(
  webhook_type: null,
  webhook_code: null,
  payment_id: null,
  new_payment_status: null,
  old_payment_status: null,
  original_reference: null,
  adjusted_reference: null,
  original_start_date: null,
  adjusted_start_date: null,
  timestamp: null,
  error: null
)
```

