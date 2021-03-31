# Plaid::AssetReportCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **access_tokens** | **Array&lt;String&gt;** | An array of access tokens corresponding to the Items that will be included in the report. The &#x60;assets&#x60; product must have been initialized for the Items during link; the Assets product cannot be added after initialization. |  |
| **days_requested** | **Integer** | The maximum integer number of days of history to include in the Asset Report. If using Fannie Mae Day 1 Certainty, &#x60;days_requested&#x60; must be at least 61 for new originations or at least 31 for refinancings. |  |
| **options** | [**AssetReportCreateRequestOptions**](AssetReportCreateRequestOptions.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportCreateRequest.new(
  client_id: null,
  secret: null,
  access_tokens: null,
  days_requested: null,
  options: null
)
```

