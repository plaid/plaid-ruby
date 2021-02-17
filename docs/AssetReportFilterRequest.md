# Plaid::AssetReportFilterRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **asset_report_token** | **String** | A token that can be provided to endpoints such as &#x60;/asset_report/get&#x60; or &#x60;/asset_report/pdf/get&#x60; to fetch or update an Asset Report. |  |
| **account_ids_to_exclude** | **Array&lt;String&gt;** | The accounts to exclude from the Asset Report, identified by &#x60;account_id&#x60;. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportFilterRequest.new(
  client_id: null,
  secret: null,
  asset_report_token: null,
  account_ids_to_exclude: null
)
```

