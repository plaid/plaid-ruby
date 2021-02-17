# Plaid::ItemStatusLastWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sent_at** | **String** | ISO 8601 timestamp of when the webhook was fired. | [optional] |
| **code_sent** | **String** | The last webhook code sent. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemStatusLastWebhook.new(
  sent_at: null,
  code_sent: null
)
```

