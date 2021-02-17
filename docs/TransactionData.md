# Plaid::TransactionData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | The description of the transaction. |  |
| **amount** | **Float** | The amount of the transaction. |  |
| **date** | **String** | The date of the transaction, in ISO 8601 format (\&quot;yyyy-mm-dd\&quot;). |  |
| **account_id** | **String** | A unique identifier for the end user&#39;s account. |  |
| **transaction_id** | **String** | A unique identifier for the transaction. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::TransactionData.new(
  description: null,
  amount: null,
  date: null,
  account_id: null,
  transaction_id: null
)
```

