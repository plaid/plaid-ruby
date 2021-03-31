# Plaid::BankTransferUser

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **legal_name** | **String** | The account holder’s full legal name. |  |
| **email_address** | **String** | The account holder’s email. | [optional] |
| **routing_number** | **String** | The account holder&#39;s routing number. This field is only used for response data. Do not provide this field when making requests. | [optional][readonly] |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferUser.new(
  legal_name: null,
  email_address: null,
  routing_number: null
)
```

