# Plaid::AssetReport

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **asset_report_id** | **String** | A unique ID identifying an Asset Report. Like all Plaid identifiers, this ID is case sensitive. |  |
| **client_report_id** | **String** | An identifier you determine and submit for the Asset Report. |  |
| **date_generated** | **String** | The date and time when the Asset Report was created, in ISO 8601 format (e.g. \&quot;2018-04-12T03:32:11Z\&quot;). |  |
| **days_requested** | **Float** | The duration of transaction history you requested |  |
| **user** | [**AssetReportUser**](AssetReportUser.md) |  |  |
| **items** | [**Array&lt;AssetReportItem&gt;**](AssetReportItem.md) | Data returned by Plaid about each of the Items included in the Asset Report. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReport.new(
  asset_report_id: null,
  client_report_id: null,
  date_generated: null,
  days_requested: null,
  user: null,
  items: null
)
```

