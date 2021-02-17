# Plaid::TransactionsRemovedWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;TRANSACTIONS&#x60; |  |
| **webhook_code** | **String** | &#x60;TRANSACTIONS_REMOVED&#x60; |  |
| **error** | [**Error**](Error.md) |  | [optional] |
| **removed_transactions** | **Array&lt;String&gt;** | An array of &#x60;transaction_ids&#x60; corresponding to the removed transactions |  |
| **item_id** | **String** | The &#x60;item_id&#x60; of the Item associated with this webhook, warning, or error |  |

## Example

```ruby
require 'plaid'

instance = Plaid::TransactionsRemovedWebhook.new(
  webhook_type: null,
  webhook_code: null,
  error: null,
  removed_transactions: null,
  item_id: null
)
```

