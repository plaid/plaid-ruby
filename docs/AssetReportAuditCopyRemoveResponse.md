# Plaid::AssetReportAuditCopyRemoveResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **removed** | **Boolean** | &#x60;true&#x60; if the Audit Copy was successfully removed. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportAuditCopyRemoveResponse.new(
  removed: null,
  request_id: null
)
```

