# Plaid::AssetReportRefreshRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **asset_report_token** | **String** | The &#x60;asset_report_token&#x60; returned by the original call to &#x60;/asset_report/create&#x60; |  |
| **days_requested** | **Integer** | The maximum number of days of history to include in the Asset Report. Must be an integer. If not specified, the value from the original call to &#x60;/asset_report/create&#x60; will be used. | [optional] |
| **options** | [**AssetReportRefreshRequestOptions**](AssetReportRefreshRequestOptions.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportRefreshRequest.new(
  client_id: null,
  secret: null,
  asset_report_token: null,
  days_requested: null,
  options: null
)
```

