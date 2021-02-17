# Plaid::DepositSwitchTokenCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **deposit_switch_token** | **String** | Deposit switch token, used to initialize Link for the Deposit Switch product |  |
| **deposit_switch_token_expiration_time** | **String** | Expiration time of the token, in ISO8601 format |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::DepositSwitchTokenCreateResponse.new(
  deposit_switch_token: null,
  deposit_switch_token_expiration_time: null,
  request_id: null
)
```

