# Plaid::PaymentInitiationPaymentGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_id** | **String** | The ID of the payment. Like all Plaid identifiers, the &#x60;payment_id&#x60; is case sensitive. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. | [optional] |
| **amount** | [**PaymentAmount**](PaymentAmount.md) |  |  |
| **status** | **String** | The status of the payment.  &#x60;PAYMENT_STATUS_INPUT_NEEDED&#x60;: This is the initial state of all payments. It indicates that the payment is waiting on user input to continue processing. A payment may re-enter this state later on if further input is needed.  &#x60;PAYMENT_STATUS_PROCESSING&#x60;: The payment is currently being processed. The payment will automatically exit this state when processing is complete.  &#x60;PAYMENT_STATUS_INITIATED&#x60;: The payment has been successfully initiated and is considered complete.  &#x60;PAYMENT_STATUS_COMPLETED&#x60;: Indicates that the standing order has been successfully established. This state is only used for standing orders.  &#x60;PAYMENT_STATUS_INSUFFICIENT_FUNDS&#x60;: The payment has failed due to insufficient funds.  &#x60;PAYMENT_STATUS_FAILED&#x60;: The payment has failed to be initiated. This error is retryable once the root cause is resolved.  &#x60;PAYMENT_STATUS_BLOCKED&#x60;: The payment has been blocked. This is a retryable error.  &#x60;PAYMENT_STATUS_UNKNOWN&#x60;: The payment status is unknown. |  |
| **recipient_id** | **String** | The ID of the recipient |  |
| **reference** | **String** | A reference for the payment. |  |
| **adjusted_reference** | **String** | The value of the reference sent to the bank after adjustment to pass bank validation rules. | [optional] |
| **last_status_update** | **String** | The date and time of the last time the &#x60;status&#x60; was updated, in IS0 8601 format |  |
| **schedule** | [**ExternalPaymentScheduleGet**](ExternalPaymentScheduleGet.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationPaymentGetResponse.new(
  payment_id: null,
  request_id: null,
  amount: null,
  status: null,
  recipient_id: null,
  reference: null,
  adjusted_reference: null,
  last_status_update: null,
  schedule: null
)
```

