# Plaid::PaymentInitiationRecipientCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
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

