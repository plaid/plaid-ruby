# Plaid::HoldingsDefaultUpdateWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;HOLDINGS&#x60; |  |
| **webhook_code** | **String** | &#x60;DEFAULT_UPDATE&#x60; |  |
| **item_id** | **String** | The &#x60;item_id&#x60; of the Item associated with this webhook, warning, or error |  |
| **error** | [**Error**](Error.md) |  | [optional] |
| **new_holdings** | **Float** | The number of new holdings reported since the last time this webhook was fired. |  |
| **updated_holdings** | **Float** | The number of updated holdings reported since the last time this webhook was fired. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::HoldingsDefaultUpdateWebhook.new(
  webhook_type: null,
  webhook_code: null,
  item_id: null,
  error: null,
  new_holdings: null,
  updated_holdings: null
)
```

