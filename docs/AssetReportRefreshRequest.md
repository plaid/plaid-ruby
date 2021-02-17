# Plaid::AssetReportRefreshRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
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

