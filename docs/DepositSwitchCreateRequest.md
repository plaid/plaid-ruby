# Plaid::DepositSwitchCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **target_access_token** | **String** | Access token for the target Item, typically provided in the Import Item response.  |  |
| **target_account_id** | **String** | Plaid Account ID that specifies the target bank account. This account will become the recipient for a user&#39;s direct deposit. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::DepositSwitchCreateRequest.new(
  client_id: null,
  secret: null,
  target_access_token: null,
  target_account_id: null
)
```

