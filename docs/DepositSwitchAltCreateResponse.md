# Plaid::DepositSwitchAltCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **deposit_switch_id** | **String** | ID of the deposit switch. This ID is persisted throughout the lifetime of the deposit switch. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::DepositSwitchAltCreateResponse.new(
  deposit_switch_id: null,
  request_id: null
)
```

