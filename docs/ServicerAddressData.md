# Plaid::ServicerAddressData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **city** | **String** | The full city name | [optional] |
| **region** | **String** | The region or state Example: &#x60;\&quot;NC\&quot;&#x60; | [optional] |
| **street** | **String** | The full street address Example: &#x60;\&quot;564 Main Street, APT 15\&quot;&#x60; | [optional] |
| **postal_code** | **String** | The postal code | [optional] |
| **country** | **String** | The ISO 3166-1 alpha-2 country code | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::ServicerAddressData.new(
  city: null,
  region: null,
  street: null,
  postal_code: null,
  country: null
)
```

