# Plaid::WebhookVerificationKeyGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **key** | [**JWKPublicKey**](JWKPublicKey.md) |  |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::WebhookVerificationKeyGetResponse.new(
  key: null,
  request_id: null
)
```

