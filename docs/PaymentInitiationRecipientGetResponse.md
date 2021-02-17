# Plaid::PaymentInitiationRecipientGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **recipient_id** | **String** | The ID of the recipient. |  |
| **name** | **String** | The name of the recipient. |  |
| **address** | [**PaymentInitiationAddress**](PaymentInitiationAddress.md) |  | [optional] |
| **iban** | **String** | The International Bank Account Number (IBAN) for the recipient. |  |
| **bacs** | [**NullableRecipientBACS**](NullableRecipientBACS.md) |  | [optional] |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationRecipientGetResponse.new(
  recipient_id: null,
  name: null,
  address: null,
  iban: null,
  bacs: null,
  request_id: null
)
```

