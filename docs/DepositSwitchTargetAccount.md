# Plaid::DepositSwitchTargetAccount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_number** | **String** | Account number for deposit switch destination |  |
| **routing_number** | **String** | Routing number for deposit switch destination |  |
| **account_name** | **String** | The name of the deposit switch destination account, as it will be displayed to the end user in the Deposit Switch interface. It is not required to match the name used in online banking. |  |
| **account_subtype** | **String** | The account subtype of the account, either &#x60;checking&#x60; or &#x60;savings&#x60;. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::DepositSwitchTargetAccount.new(
  account_number: null,
  routing_number: null,
  account_name: null,
  account_subtype: null
)
```

