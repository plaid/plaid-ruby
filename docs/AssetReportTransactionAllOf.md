# Plaid::AssetReportTransactionAllOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date_transacted** | **String** | The date on which the transaction took place, in IS0 8601 format. | [optional] |
| **original_description** | **String** | The string returned by the financial institution to describe the transaction |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AssetReportTransactionAllOf.new(
  date_transacted: null,
  original_description: null
)
```

