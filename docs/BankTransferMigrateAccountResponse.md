# Plaid::BankTransferMigrateAccountResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **access_token** | **String** | The Plaid &#x60;access_token&#x60; for the newly created Item. |  |
| **account_id** | **String** | The Plaid &#x60;account_id&#x60; for the newly created Item. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferMigrateAccountResponse.new(
  access_token: null,
  account_id: null,
  request_id: null
)
```

