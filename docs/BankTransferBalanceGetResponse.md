# Plaid::BankTransferBalanceGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **balance** | [**BankTransferBalance**](BankTransferBalance.md) |  |  |
| **origination_account_id** | **String** | The ID of the origination account that this balance belongs to. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferBalanceGetResponse.new(
  balance: null,
  origination_account_id: null,
  request_id: null
)
```

