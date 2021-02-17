# Plaid::BankTransferEventListRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **start_date** | **Time** | The start datetime of bank transfers to list. This should be in RFC 3339 format (i.e. &#x60;2019-12-06T22:35:49Z&#x60;) | [optional] |
| **end_date** | **Time** | The end datetime of bank transfers to list. This should be in RFC 3339 format (i.e. &#x60;2019-12-06T22:35:49Z&#x60;) | [optional] |
| **bank_transfer_id** | **String** | Plaid’s unique identifier for a bank transfer. | [optional] |
| **account_id** | **String** | The account ID to get events for all transactions to/from an account. | [optional] |
| **bank_transfer_type** | **String** | The type of bank transfer. This will be either &#x60;debit&#x60; or &#x60;credit&#x60;.  A &#x60;debit&#x60; indicates a transfer of money into your origination account; a &#x60;credit&#x60; indicates a transfer of money out of your origination account. | [optional] |
| **event_types** | [**Array&lt;BankTransferEventType&gt;**](BankTransferEventType.md) | Filter events by event type. | [optional] |
| **count** | **Integer** | The maximum number of bank transfer events to return. If the number of events matching the above parameters is greater than &#x60;count&#x60;, the most recent events will be returned. | [optional][default to 25] |
| **offset** | **Integer** | The offset into the list of bank transfer events. When &#x60;count&#x60;&#x3D;25 and &#x60;offset&#x60;&#x3D;0, the first 25 events will be returned. When &#x60;count&#x60;&#x3D;25 and &#x60;offset&#x60;&#x3D;25, the next 25 bank transfer events will be returned. | [optional][default to 0] |
| **origination_account_id** | **String** | The origination account ID to get events for transfers from a specific origination account. | [optional] |
| **direction** | **String** | Indicates the direction of the transfer: &#x60;outbound&#x60; for API-initiated transfers, or &#x60;inbound&#x60; for payments received by the FBO account. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferEventListRequest.new(
  client_id: null,
  secret: null,
  start_date: null,
  end_date: null,
  bank_transfer_id: null,
  account_id: null,
  bank_transfer_type: null,
  event_types: null,
  count: null,
  offset: null,
  origination_account_id: null,
  direction: null
)
```

