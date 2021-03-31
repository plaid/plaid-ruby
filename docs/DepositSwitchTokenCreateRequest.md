# Plaid::DepositSwitchTokenCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **deposit_switch_id** | **String** | The ID of the deposit switch |  |

## Example

```ruby
require 'plaid'

instance = Plaid::DepositSwitchTokenCreateRequest.new(
  client_id: null,
  secret: null,
  deposit_switch_id: null
)
```

