# Plaid::SandboxItemFireWebhookRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **access_token** | **String** | The access token associated with the Item data is being requested for. |  |
| **webhook_code** | **String** | The following values for &#x60;webhook_code&#x60; are supported:  * &#x60;DEFAULT_UPDATE&#x60; | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::SandboxItemFireWebhookRequest.new(
  client_id: null,
  secret: null,
  access_token: null,
  webhook_code: null
)
```

