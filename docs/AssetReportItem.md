# Plaid::AssetReportItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **item_id** | **String** | The &#x60;item_id&#x60; of the Item associated with this webhook, warning, or error |  |
| **institution_name** | **String** | The full financial institution name associated with the Item. |  |
| **institution_id** | **String** | The id of the financial institution associated with the Item. |  |
| **date_last_updated** | **String** | The date and time when this Item’s data was last retrieved from the financial institution, in ISO 8601 format. |  |
| **accounts** | [**Array&lt;AccountAssets&gt;**](AccountAssets.md) | Data about each of the accounts open on the Item. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportItem.new(
  item_id: null,
  institution_name: null,
  institution_id: null,
  date_last_updated: null,
  accounts: null
)
```

