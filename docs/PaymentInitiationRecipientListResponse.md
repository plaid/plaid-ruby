# Plaid::PaymentInitiationRecipientListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **recipients** | [**Array&lt;PaymentInitiationRecipient&gt;**](PaymentInitiationRecipient.md) | An array of payment recipients created for Payment Initiation |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationRecipientListResponse.new(
  recipients: null,
  request_id: null
)
```

