# Plaid::SandboxPublicTokenCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **institution_id** | **String** | The ID of the institution the Item will be associated with |  |
| **initial_products** | [**Array&lt;Products&gt;**](Products.md) | The products to initially pull for the Item. May be any products that the specified &#x60;institution_id&#x60;  supports. This array may not be empty. |  |
| **options** | [**SandboxPublicTokenCreateRequestOptions**](SandboxPublicTokenCreateRequestOptions.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::SandboxPublicTokenCreateRequest.new(
  client_id: null,
  secret: null,
  institution_id: null,
  initial_products: null,
  options: null
)
```

