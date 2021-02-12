# Plaid::InstitutionsGetByIdResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **institution** | [**Institution**](Institution.md) |  |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::InstitutionsGetByIdResponse.new(
  institution: null,
  request_id: null
)
```

