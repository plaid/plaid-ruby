# Plaid::InstitutionsGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **institutions** | [**Array&lt;Institution&gt;**](Institution.md) | A list of Plaid Institution |  |
| **total** | **Integer** | The total number of institutions available via this endpoint |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::InstitutionsGetResponse.new(
  institutions: null,
  total: null,
  request_id: null
)
```

