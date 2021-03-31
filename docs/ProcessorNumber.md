# Plaid::ProcessorNumber

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ach** | [**NullableNumbersACH**](NullableNumbersACH.md) |  | [optional] |
| **eft** | [**NullableNumbersEFT**](NullableNumbersEFT.md) |  | [optional] |
| **international** | [**NullableNumbersInternational**](NullableNumbersInternational.md) |  | [optional] |
| **bacs** | [**NullableNumbersBACS**](NullableNumbersBACS.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::ProcessorNumber.new(
  ach: null,
  eft: null,
  international: null,
  bacs: null
)
```

