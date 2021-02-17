# Plaid::LinkTokenGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **link_token** | **String** | A &#x60;link_token&#x60; from a previous invocation of &#x60;/link/token/create&#x60; |  |

## Example

```ruby
require 'plaid'

instance = Plaid::LinkTokenGetRequest.new(
  client_id: null,
  secret: null,
  link_token: null
)
```

