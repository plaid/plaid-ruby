# Plaid::AccountAssetsAllOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **days_available** | **Float** | The duration of transaction history available for this Item, typically defined as the time since the date of the earliest transaction in that account. Only returned by Assets endpoints. | [optional] |
| **transactions** | [**Array&lt;AssetReportTransaction&gt;**](AssetReportTransaction.md) | Transaction history associated with the account. Only returned by Assets endpoints. Transaction history returned by endpoints such as &#x60;/transactions/get&#x60; or &#x60;/investments/transactions/get&#x60; will be returned in the top-level &#x60;transactions&#x60; field instead. | [optional] |
| **owners** | [**Array&lt;Owner&gt;**](Owner.md) | Data returned by the financial institution about the account owner or owners. Only returned by Identity or Assets endpoints. Multiple owners on a single account will be represented in the same &#x60;owner&#x60; object, not in multiple owner objects within the array. |  |
| **historical_balances** | [**Array&lt;HistoricalBalance&gt;**](HistoricalBalance.md) | Calculated data about the historical balances on the account. Only returned by Assets endpoints. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::AccountAssetsAllOf.new(
  days_available: null,
  transactions: null,
  owners: null,
  historical_balances: null
)
```

