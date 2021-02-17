# Plaid::AssetReportGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **asset_report_token** | **String** | A token that can be provided to endpoints such as &#x60;/asset_report/get&#x60; or &#x60;/asset_report/pdf/get&#x60; to fetch or update an Asset Report. |  |
| **include_insights** | **Boolean** | &#x60;true&#x60; if you would like to retrieve the Asset Report with Insights, &#x60;false&#x60; otherwise. This field defaults to &#x60;false&#x60; if omitted. [Contact Plaid Support](https://dashboard.plaid.com/support) to get access to this feature. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportGetRequest.new(
  client_id: null,
  secret: null,
  asset_report_token: null,
  include_insights: null
)
```

