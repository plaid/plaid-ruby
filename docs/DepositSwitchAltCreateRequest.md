# Plaid::DepositSwitchAltCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **target_account** | [**DepositSwitchTargetAccount**](DepositSwitchTargetAccount.md) |  |  |
| **target_user** | [**DepositSwitchTargetUser**](DepositSwitchTargetUser.md) |  |  |

## Example

```ruby
require 'plaid'

instance = Plaid::DepositSwitchAltCreateRequest.new(
  client_id: null,
  secret: null,
  target_account: null,
  target_user: null
)
```

