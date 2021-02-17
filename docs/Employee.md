# Plaid::Employee

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The name of the employee. | [optional] |
| **address** | [**NullableAddressData**](NullableAddressData.md) |  | [optional] |
| **ssn_masked** | **String** | The SSN of the employee, with all but the last 4 digits masked out. For example: \&quot;XXX-XX-1111\&quot;. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::Employee.new(
  name: null,
  address: null,
  ssn_masked: null
)
```

