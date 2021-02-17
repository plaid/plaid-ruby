# Plaid::ItemPublicTokenCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **public_token** | **String** | A &#x60;public_token&#x60; for the particular Item corresponding to the specified &#x60;access_token&#x60; |  |
| **expiration** | **Time** |  | [optional] |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemPublicTokenCreateResponse.new(
  public_token: null,
  expiration: null,
  request_id: null
)
```

