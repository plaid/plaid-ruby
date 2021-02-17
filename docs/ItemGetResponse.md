# Plaid::ItemGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **item** | [**Item**](Item.md) |  |  |
| **status** | [**NullableItemStatus**](NullableItemStatus.md) |  | [optional] |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |
| **access_token** | [**NullableAccessToken**](NullableAccessToken.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemGetResponse.new(
  item: null,
  status: null,
  request_id: null,
  access_token: null
)
```

