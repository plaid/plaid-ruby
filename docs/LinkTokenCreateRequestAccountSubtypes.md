# Plaid::LinkTokenCreateRequestAccountSubtypes

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **depository** | **Hash&lt;String, Object&gt;** | A filter to apply to &#x60;depository&#x60;-type accounts | [optional] |
| **credit** | **Hash&lt;String, Object&gt;** | A filter to apply to &#x60;credit&#x60;-type accounts | [optional] |
| **loan** | **Hash&lt;String, Object&gt;** | A filter to apply to &#x60;loan&#x60;-type accounts | [optional] |
| **investment** | **Hash&lt;String, Object&gt;** | A filter to apply to &#x60;investment&#x60;-type accounts | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::LinkTokenCreateRequestAccountSubtypes.new(
  depository: null,
  credit: null,
  loan: null,
  investment: null
)
```

