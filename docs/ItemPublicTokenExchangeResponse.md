# Plaid::ItemPublicTokenExchangeResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **access_token** | **String** | The access token associated with the Item data is being requested for. |  |
| **item_id** | **String** | The &#x60;item_id&#x60; value of the Item associated with the returned &#x60;access_token&#x60; |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemPublicTokenExchangeResponse.new(
  access_token: null,
  item_id: null,
  request_id: null
)
```

