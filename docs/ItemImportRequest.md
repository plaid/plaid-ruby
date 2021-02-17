# Plaid::ItemImportRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **products** | [**Array&lt;Products&gt;**](Products.md) | Array of product strings |  |
| **user_auth** | [**ItemImportRequestUserAuth**](ItemImportRequestUserAuth.md) |  |  |
| **options** | [**ItemImportRequestOptions**](ItemImportRequestOptions.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemImportRequest.new(
  client_id: null,
  secret: null,
  products: null,
  user_auth: null,
  options: null
)
```

