# Plaid::DepositSwitchTargetUser

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **given_name** | **String** | The given name (first name) of the user. |  |
| **family_name** | **String** | The family name (last name) of the user. |  |
| **phone** | **String** | The phone number of the user. The endpoint can accept a variety of phone number formats, including E.164. |  |
| **email** | **String** | The email address of the user. |  |
| **address** | [**DepositSwitchAddressData**](DepositSwitchAddressData.md) |  | [optional] |
| **tax_payer_id** | **String** | The taxpayer ID of the user, generally their SSN, EIN, or TIN. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::DepositSwitchTargetUser.new(
  given_name: null,
  family_name: null,
  phone: null,
  email: null,
  address: null,
  tax_payer_id: null
)
```

