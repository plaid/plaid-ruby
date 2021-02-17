# Plaid::PendingExpirationWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;ITEM&#x60; |  |
| **webhook_code** | **String** | &#x60;PENDING_EXPIRATION&#x60; |  |
| **item_id** | **String** | The &#x60;item_id&#x60; of the Item associated with this webhook, warning, or error |  |
| **consent_expiration_time** | **String** | The date and time at which the Item&#39;s access consent will expire, in ISO 8601 format |  |

## Example

```ruby
require 'plaid'

instance = Plaid::PendingExpirationWebhook.new(
  webhook_type: null,
  webhook_code: null,
  item_id: null,
  consent_expiration_time: null
)
```

