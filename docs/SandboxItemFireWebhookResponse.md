# Plaid::SandboxItemFireWebhookResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_fired** | **Boolean** | Value is &#x60;true&#x60;  if the test&#x60; webhook_code&#x60;  was successfully fired. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::SandboxItemFireWebhookResponse.new(
  webhook_fired: null,
  request_id: null
)
```

