# Plaid::BankTransferEvent

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event_id** | **Integer** | Plaid’s unique identifier for this event. IDs are sequential unsigned 64-bit integers. |  |
| **timestamp** | **String** | The datetime when this event occurred. This will be of the form &#x60;2006-01-02T15:04:05Z&#x60;. |  |
| **event_type** | [**BankTransferEventType**](BankTransferEventType.md) |  |  |
| **account_id** | **String** | The account ID associated with the bank transfer. |  |
| **bank_transfer_id** | **String** | Plaid’s unique identifier for a bank transfer. |  |
| **origination_account_id** | **String** | The ID of the origination account that this balance belongs to. | [optional] |
| **bank_transfer_type** | [**BankTransferType**](BankTransferType.md) |  |  |
| **bank_transfer_amount** | **String** | The bank transfer amount. |  |
| **bank_transfer_iso_currency_code** | **String** | The currency of the bank transfer amount. |  |
| **failure_reason** | [**BankTransferFailure**](BankTransferFailure.md) |  |  |
| **direction** | [**BankTransferDirection**](BankTransferDirection.md) |  |  |
| **receiver_details** | [**BankTransferReceiverDetails**](BankTransferReceiverDetails.md) |  |  |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferEvent.new(
  event_id: null,
  timestamp: null,
  event_type: null,
  account_id: null,
  bank_transfer_id: null,
  origination_account_id: null,
  bank_transfer_type: null,
  bank_transfer_amount: null,
  bank_transfer_iso_currency_code: null,
  failure_reason: null,
  direction: null,
  receiver_details: null
)
```

