# Plaid::InstitutionsSearchResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **institutions** | [**Array&lt;Institution&gt;**](Institution.md) | An array of institutions matching the search criteria |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::InstitutionsSearchResponse.new(
  institutions: null,
  request_id: null
)
```

