# Plaid::SandboxPublicTokenCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **public_token** | **String** | A public token that can be exchanged for an access token using &#x60;/item/public_token/exchange&#x60; |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::SandboxPublicTokenCreateResponse.new(
  public_token: null,
  request_id: null
)
```

