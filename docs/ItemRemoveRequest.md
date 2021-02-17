# Plaid::ItemRemoveRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **access_token** | **String** | The access token associated with the Item data is being requested for. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemRemoveRequest.new(
  client_id: null,
  secret: null,
  access_token: null
)
```

