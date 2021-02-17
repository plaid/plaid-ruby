# Plaid::InvestmentsTransactionsGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **access_token** | **String** | The access token associated with the Item data is being requested for. |  |
| **start_date** | **Date** | The earliest date for which to fetch transaction history. Dates should be formatted as YYYY-MM-DD. |  |
| **end_date** | **Date** | The most recent date for which to fetch transaction history. Dates should be formatted as YYYY-MM-DD. |  |
| **options** | [**InvestmentsTransactionsGetRequestOptions**](InvestmentsTransactionsGetRequestOptions.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::InvestmentsTransactionsGetRequest.new(
  client_id: null,
  secret: null,
  access_token: null,
  start_date: null,
  end_date: null,
  options: null
)
```

