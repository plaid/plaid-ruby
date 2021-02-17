# Plaid::Cause

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **item_id** | **String** | The &#x60;item_id&#x60; of the Item associated with this webhook, warning, or error |  |
| **error** | [**Error**](Error.md) |  |  |

## Example

```ruby
require 'plaid'

instance = Plaid::Cause.new(
  item_id: null,
  error: null
)
```

