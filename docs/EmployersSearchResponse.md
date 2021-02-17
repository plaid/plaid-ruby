# Plaid::EmployersSearchResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **employers** | [**Array&lt;Employer&gt;**](Employer.md) | A list of employers matching the search criteria. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::EmployersSearchResponse.new(
  employers: null,
  request_id: null
)
```

