# Plaid::ItemWebhookUpdateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **access_token** | **String** | The access token associated with the Item data is being requested for. |  |
| **webhook** | **String** | The new webhook URL to associate with the Item. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemWebhookUpdateRequest.new(
  client_id: null,
  secret: null,
  access_token: null,
  webhook: null
)
```

