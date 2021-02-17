# Plaid::AssetReportAuditCopyGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **audit_copy_token** | **String** | The &#x60;audit_copy_token&#x60; granting access to the Audit Copy you would like to get. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportAuditCopyGetRequest.new(
  client_id: null,
  secret: null,
  audit_copy_token: null
)
```

