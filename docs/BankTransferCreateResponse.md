# Plaid::BankTransferCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bank_transfer** | [**BankTransfer**](BankTransfer.md) |  |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferCreateResponse.new(
  bank_transfer: null,
  request_id: null
)
```

