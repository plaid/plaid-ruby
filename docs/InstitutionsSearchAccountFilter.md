# Plaid::InstitutionsSearchAccountFilter

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **loan** | [**Array&lt;AccountSubtype&gt;**](AccountSubtype.md) |  | [optional] |
| **depository** | [**Array&lt;AccountSubtype&gt;**](AccountSubtype.md) |  | [optional] |
| **credit** | [**Array&lt;AccountSubtype&gt;**](AccountSubtype.md) |  | [optional] |
| **investment** | [**Array&lt;AccountSubtype&gt;**](AccountSubtype.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::InstitutionsSearchAccountFilter.new(
  loan: null,
  depository: null,
  credit: null,
  investment: null
)
```

