# Plaid::AssetReportAuditCopyCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **audit_copy_token** | **String** | A token that can be shared with a third party auditor to allow them to obtain access to the Asset Report. This token should be stored securely. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportAuditCopyCreateResponse.new(
  audit_copy_token: null,
  request_id: null
)
```

