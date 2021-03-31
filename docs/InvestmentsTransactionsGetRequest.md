# Plaid::InvestmentsTransactionsGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
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

