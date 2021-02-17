# Plaid::LinkTokenCreateRequestIncomeVerification

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **income_verification_id** | **String** | The &#x60;income_verification_id&#x60; of the verification instance, as provided by &#x60;/income/verification/create&#x60;. |  |
| **asset_report_id** | **String** | The &#x60;asset_report_id&#x60; of an asset report associated with the user, as provided by &#x60;/asset_report/create&#x60;. Providing an &#x60;asset_report_id&#x60; is optional and can be used to verify the user through a streamlined flow. If provided, the bank linking flow will be skipped. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::LinkTokenCreateRequestIncomeVerification.new(
  income_verification_id: null,
  asset_report_id: null
)
```

