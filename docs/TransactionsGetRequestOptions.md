# Plaid::TransactionsGetRequestOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_ids** | **Array&lt;String&gt;** | A list of &#x60;account_ids&#x60; to retrieve for the Item  Note: An error will be returned if a provided &#x60;account_id&#x60; is not associated with the Item. | [optional] |
| **count** | **Integer** | The number of transactions to fetch. | [optional][default to 100] |
| **offset** | **Integer** | The number of transactions to skip. The default value is 0. | [optional][default to 0] |

## Example

```ruby
require 'plaid'

instance = Plaid::TransactionsGetRequestOptions.new(
  account_ids: null,
  count: null,
  offset: null
)
```

