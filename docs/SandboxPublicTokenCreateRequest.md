# Plaid::SandboxPublicTokenCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
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

