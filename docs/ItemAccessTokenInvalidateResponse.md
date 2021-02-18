# Plaid::ItemAccessTokenInvalidateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **new_access_token** | **String** | The access token associated with the Item data is being requested for. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemAccessTokenInvalidateResponse.new(
  new_access_token: null,
  request_id: null
)
```

