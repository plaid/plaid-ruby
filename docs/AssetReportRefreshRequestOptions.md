# Plaid::AssetReportRefreshRequestOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_report_id** | **String** | Client-generated identifier, which can be used by lenders to track loan applications. | [optional] |
| **webhook** | **String** | URL to which Plaid will send Assets webhooks, for example when the requested Asset Report is ready. | [optional] |
| **user** | [**AssetReportUser**](AssetReportUser.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportRefreshRequestOptions.new(
  client_report_id: null,
  webhook: null,
  user: null
)
```

