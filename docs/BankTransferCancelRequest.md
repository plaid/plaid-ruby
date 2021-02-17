# Plaid::BankTransferCancelRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **bank_transfer_id** | **String** | Plaid’s unique identifier for a bank transfer. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferCancelRequest.new(
  client_id: null,
  secret: null,
  bank_transfer_id: null
)
```

