# Plaid::BankTransferMigrateAccountRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **account_number** | **String** | The user&#39;s account number. |  |
| **routing_number** | **String** | The user&#39;s routing number. |  |
| **account_type** | **String** | The type of the bank account (&#x60;checking&#x60; or &#x60;savings&#x60;). |  |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferMigrateAccountRequest.new(
  client_id: null,
  secret: null,
  account_number: null,
  routing_number: null,
  account_type: null
)
```

