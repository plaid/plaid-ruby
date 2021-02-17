# Plaid::ItemProductReadyWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;INCOME&#x60; |  |
| **webhook_code** | **String** | &#x60;PRODUCT_READY&#x60; |  |
| **item_id** | **String** | The &#x60;item_id&#x60; of the Item associated with this webhook, warning, or error |  |
| **error** | [**Error**](Error.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemProductReadyWebhook.new(
  webhook_type: null,
  webhook_code: null,
  item_id: null,
  error: null
)
```

