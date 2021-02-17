# Plaid::ItemPublicTokenExchangeRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **public_token** | **String** | Your &#x60;public_token&#x60;, obtained from the Link &#x60;onSuccess&#x60; callback or &#x60;/sandbox/item/public_token/create&#x60;. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemPublicTokenExchangeRequest.new(
  client_id: null,
  secret: null,
  public_token: null
)
```

