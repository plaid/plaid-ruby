# Plaid::ItemPublicTokenExchangeRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
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

