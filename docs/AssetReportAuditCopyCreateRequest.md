# Plaid::AssetReportAuditCopyCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **asset_report_token** | **String** | A token that can be provided to endpoints such as &#x60;/asset_report/get&#x60; or &#x60;/asset_report/pdf/get&#x60; to fetch or update an Asset Report. |  |
| **auditor_id** | **String** | The &#x60;auditor_id&#x60; of the third party with whom you would like to share the Asset Report. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportAuditCopyCreateRequest.new(
  client_id: null,
  secret: null,
  asset_report_token: null,
  auditor_id: null
)
```

