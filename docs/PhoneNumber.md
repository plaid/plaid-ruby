# Plaid::PhoneNumber

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | **String** | The phone number. |  |
| **primary** | **Boolean** | When &#x60;true&#x60;, identifies the phone number as the primary number on an account. | [optional] |
| **type** | **String** | The type of phone number. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::PhoneNumber.new(
  data: null,
  primary: null,
  type: null
)
```

