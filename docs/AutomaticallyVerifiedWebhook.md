# Plaid::AutomaticallyVerifiedWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;AUTH&#x60; |  |
| **webhook_code** | **String** | &#x60;AUTOMATICALLY_VERIFIED&#x60; |  |
| **account_id** | **String** | The &#x60;account_id&#x60; of the account associated with the webhook |  |
| **item_id** | **String** | The &#x60;item_id&#x60; of the Item associated with this webhook, warning, or error |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AutomaticallyVerifiedWebhook.new(
  webhook_type: null,
  webhook_code: null,
  account_id: null,
  item_id: null
)
```

