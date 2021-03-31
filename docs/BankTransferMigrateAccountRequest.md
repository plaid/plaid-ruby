# Plaid::BankTransferMigrateAccountRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
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

