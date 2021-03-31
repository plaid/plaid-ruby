# Plaid::AssetReportAuditCopyRemoveRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **audit_copy_token** | **String** | The &#x60;audit_copy_token&#x60; granting access to the Audit Copy you would like to revoke. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportAuditCopyRemoveRequest.new(
  client_id: null,
  secret: null,
  audit_copy_token: null
)
```

