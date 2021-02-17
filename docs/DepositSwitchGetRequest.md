# Plaid::DepositSwitchGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **deposit_switch_id** | **String** | The ID of the deposit switch |  |

## Example

```ruby
require 'plaid'

instance = Plaid::DepositSwitchGetRequest.new(
  client_id: null,
  secret: null,
  deposit_switch_id: null
)
```

