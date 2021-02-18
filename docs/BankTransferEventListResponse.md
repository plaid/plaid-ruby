# Plaid::BankTransferEventListResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bank_transfer_events** | [**Array&lt;BankTransferEvent&gt;**](BankTransferEvent.md) |  |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferEventListResponse.new(
  bank_transfer_events: null,
  request_id: null
)
```

