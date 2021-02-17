# Plaid::InvestmentsTransactionsGetRequestOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_ids** | **Array&lt;String&gt;** | An array of &#x60;account_ids&#x60; to retrieve for the Item. | [optional] |
| **count** | **Integer** | The number of transactions to fetch.  | [optional][default to 100] |
| **offset** | **Integer** | The number of transactions to skip when fetching transaction history | [optional][default to 0] |

## Example

```ruby
require 'plaid'

instance = Plaid::InvestmentsTransactionsGetRequestOptions.new(
  account_ids: null,
  count: null,
  offset: null
)
```

