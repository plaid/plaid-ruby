# Plaid::TransactionsGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accounts** | [**Array&lt;AccountBase&gt;**](AccountBase.md) | An array containing the &#x60;accounts&#x60; associated with the Item for which transactions are being returned. Each transaction can be mapped to its corresponding account via the &#x60;account_id&#x60; field. |  |
| **transactions** | [**Array&lt;Transaction&gt;**](Transaction.md) | An array containing transactions from the account. Transactions are returned in reverse chronological order, with the most recent at the beginning of the array. The maximum number of transactions returned is determined by the &#x60;count&#x60; parameter. |  |
| **total_transactions** | **Integer** | The total number of transactions available within the date range specified. If &#x60;total_transactions&#x60; is larger than the size of the &#x60;transactions&#x60; array, more transactions are available and can be fetched via manipulating the &#x60;offset&#x60; parameter. |  |
| **item** | [**Item**](Item.md) |  |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::TransactionsGetResponse.new(
  accounts: null,
  transactions: null,
  total_transactions: null,
  item: null,
  request_id: null
)
```

