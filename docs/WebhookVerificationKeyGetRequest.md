# Plaid::WebhookVerificationKeyGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **key_id** | **String** | The key ID ( &#x60;kid&#x60; ) from the JWT header. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::WebhookVerificationKeyGetRequest.new(
  client_id: null,
  secret: null,
  key_id: null
)
```

