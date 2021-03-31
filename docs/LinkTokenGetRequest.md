# Plaid::LinkTokenGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
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

