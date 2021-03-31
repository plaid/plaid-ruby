# Plaid::AssetReportGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **report** | [**AssetReport**](AssetReport.md) |  |  |
| **warnings** | [**Array&lt;Warning&gt;**](Warning.md) | If the Asset Report generation was successful but identity information cannot be returned, this array will contain information about the errors causing identity information to be missing |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportGetResponse.new(
  report: null,
  warnings: null,
  request_id: null
)
```

