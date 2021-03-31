# Plaid::InvestmentsDefaultUpdateWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;INVESTMENTS_TRANSACTIONS&#x60; |  |
| **webhook_code** | **String** | &#x60;DEFAULT_UPDATE&#x60; |  |
| **item_id** | **String** | The &#x60;item_id&#x60; of the Item associated with this webhook, warning, or error |  |
| **error** | [**Error**](Error.md) |  | [optional] |
| **new_investments_transactions** | **Float** | The number of new transactions reported since the last time this webhook was fired. |  |
| **canceled_investments_transactions** | **Float** | The number of canceled transactions reported since the last time this webhook was fired. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::InvestmentsDefaultUpdateWebhook.new(
  webhook_type: null,
  webhook_code: null,
  item_id: null,
  error: null,
  new_investments_transactions: null,
  canceled_investments_transactions: null
)
```

