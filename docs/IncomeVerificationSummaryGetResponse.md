# Plaid::IncomeVerificationSummaryGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **income_summaries** | [**Array&lt;IncomeSummary&gt;**](IncomeSummary.md) | A list of income summaries. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::IncomeVerificationSummaryGetResponse.new(
  income_summaries: null,
  request_id: null
)
```

