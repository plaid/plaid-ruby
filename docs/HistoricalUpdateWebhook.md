# Plaid::HistoricalUpdateWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;TRANSACTIONS&#x60; |  |
| **webhook_code** | **String** | &#x60;HISTORICAL_UPDATE&#x60; |  |
| **error** | [**Error**](Error.md) |  | [optional] |
| **new_transactions** | **Float** | The number of new, unfetched transactions available |  |
| **item_id** | **String** | The &#x60;item_id&#x60; of the Item associated with this webhook, warning, or error |  |

## Example

```ruby
require 'plaid'

instance = Plaid::HistoricalUpdateWebhook.new(
  webhook_type: null,
  webhook_code: null,
  error: null,
  new_transactions: null,
  item_id: null
)
```

