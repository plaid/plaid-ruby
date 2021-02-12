# Plaid::AssetsProductReadyWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;ASSETS&#x60; |  |
| **webhook_code** | **String** | &#x60;PRODUCT_READY&#x60; |  |
| **asset_report_id** | **String** | The &#x60;asset_report_id&#x60; that can be provided to &#x60;/asset_report/get&#x60; to retrieve the Asset Report. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetsProductReadyWebhook.new(
  webhook_type: null,
  webhook_code: null,
  asset_report_id: null
)
```

