# Plaid::BankTransferBalanceGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **origination_account_id** | **String** | If multiple origination accounts are available, &#x60;origination_account_id&#x60; must be used to specify the account for which balance will be returned. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferBalanceGetRequest.new(
  client_id: null,
  secret: null,
  origination_account_id: null
)
```

