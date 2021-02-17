# Plaid::CategoriesGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **categories** | [**Array&lt;Category&gt;**](Category.md) | An array of all of the transaction categories used by Plaid. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::CategoriesGetResponse.new(
  categories: null,
  request_id: null
)
```

