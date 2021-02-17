# Plaid::PaymentInitiationRecipientCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **name** | **String** | The name of the recipient |  |
| **iban** | **String** | The International Bank Account Number (IBAN) for the recipient. If BACS data is not provided, an IBAN is required. | [optional] |
| **bacs** | [**NullableRecipientBACS**](NullableRecipientBACS.md) |  | [optional] |
| **address** | [**PaymentInitiationAddress**](PaymentInitiationAddress.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationRecipientCreateRequest.new(
  client_id: null,
  secret: null,
  name: null,
  iban: null,
  bacs: null,
  address: null
)
```

