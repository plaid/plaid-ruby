# Plaid::PaymentInitiationPaymentListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payments** | [**Array&lt;PaymentInitiationPaymentGetResponse&gt;**](PaymentInitiationPaymentGetResponse.md) | An array of payments that have been created, associated with the given &#x60;client_id&#x60;. |  |
| **next_cursor** | **String** | The value that, when used as the optional &#x60;cursor&#x60; parameter to &#x60;/payment_initiation/payment/list&#x60;, will return the next unreturned payment as its first payment. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationPaymentListResponse.new(
  payments: null,
  next_cursor: null,
  request_id: null
)
```

