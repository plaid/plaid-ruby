# Plaid::BankTransferEventSyncRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **after_id** | **Integer** | The latest (largest) &#x60;event_id&#x60; fetched via the sync endpoint, or 0 initially. |  |
| **count** | **Integer** | The maximum number of bank transfer events to return. | [optional][default to 25] |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferEventSyncRequest.new(
  client_id: null,
  secret: null,
  after_id: null,
  count: null
)
```

