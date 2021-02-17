# Plaid::DefaultUpdateWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;TRANSACTIONS&#x60; |  |
| **webhook_code** | **String** | &#x60;DEFAULT_UPDATE&#x60; |  |
| **error** | [**Error**](Error.md) |  | [optional] |
| **new_transactions** | **Float** | The number of new transactions detected since the last time this webhook was fired. |  |
| **item_id** | **String** | The &#x60;item_id&#x60; of the Item the webhook relates to. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::DefaultUpdateWebhook.new(
  webhook_type: null,
  webhook_code: null,
  error: null,
  new_transactions: null,
  item_id: null
)
```

