# Plaid::ItemWebhookUpdateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **item** | [**Item**](Item.md) |  |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemWebhookUpdateResponse.new(
  item: null,
  request_id: null
)
```

