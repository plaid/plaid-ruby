# Plaid::PaymentMeta

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reference_number** | **String** | The transaction reference number supplied by the financial institution. | [optional] |
| **ppd_id** | **String** | The ACH PPD ID for the payer. | [optional] |
| **payee** | **String** | For transfers, the party that is receiving the transaction. | [optional] |
| **by_order_of** | **String** | The party initiating a wire transfer. Will be &#x60;null&#x60; if the transaction is not a wire transfer. | [optional] |
| **payer** | **String** | For transfers, the party that is paying the transaction. | [optional] |
| **payment_method** | **String** | The type of transfer, e.g. &#39;ACH&#39; | [optional] |
| **payment_processor** | **String** | The name of the payment processor | [optional] |
| **reason** | **String** | The payer-supplied description of the transfer. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentMeta.new(
  reference_number: null,
  ppd_id: null,
  payee: null,
  by_order_of: null,
  payer: null,
  payment_method: null,
  payment_processor: null,
  reason: null
)
```

