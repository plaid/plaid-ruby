# Plaid::PaymentInitiationRecipientGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **recipient_id** | **String** | The ID of the recipient |  |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationRecipientGetRequest.new(
  client_id: null,
  secret: null,
  recipient_id: null
)
```

