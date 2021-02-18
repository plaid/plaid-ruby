# Plaid::PaymentInitiationRecipient

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **recipient_id** | **String** | The ID of the recipient. Like all Plaid identifiers, the &#x60;recipient_id&#x60; is case sensitive. |  |
| **name** | **String** | The name of the recipient |  |
| **address** | [**PaymentInitiationAddress**](PaymentInitiationAddress.md) |  |  |
| **iban** | **String** | The International Bank Account Number (IBAN) for the recipient. | [optional] |
| **bacs** | [**PaymentInitiationRecipientBacs**](PaymentInitiationRecipientBacs.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationRecipient.new(
  recipient_id: null,
  name: null,
  address: null,
  iban: null,
  bacs: null
)
```

