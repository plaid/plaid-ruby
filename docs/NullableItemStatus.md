# Plaid::NullableItemStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **investments** | **Hash&lt;String, Object&gt;** | Information about the last successful and failed investments update for the Item. | [optional] |
| **transactions** | **Hash&lt;String, Object&gt;** | Information about the last successful and failed transactions update for the Item. | [optional] |
| **last_webhook** | **Hash&lt;String, Object&gt;** | Information about the last webhook fired for the Item. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::NullableItemStatus.new(
  investments: null,
  transactions: null,
  last_webhook: null
)
```

