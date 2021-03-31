# Plaid::PaymentInitiationAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **street** | **Array&lt;String&gt;** | An array of length 1-2 representing the street address where the recipient is located. Maximum of 70 characters. | [optional] |
| **city** | **String** | The city where the recipient is located. Maximum of 35 characters. | [optional] |
| **postal_code** | **String** | The postal code where the recipient is located. Maximum of 16 characters. | [optional] |
| **country** | **String** | The ISO 3166-1 alpha-2 country code where the recipient is located. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationAddress.new(
  street: null,
  city: null,
  postal_code: null,
  country: null
)
```

