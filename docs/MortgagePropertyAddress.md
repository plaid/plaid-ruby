# Plaid::MortgagePropertyAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **city** | **String** | The city name. | [optional] |
| **country** | **String** | The ISO 3166-1 alpha-2 country code. | [optional] |
| **postal_code** | **String** | The five or nine digit postal code. | [optional] |
| **region** | **String** | The region or state (example \&quot;NC\&quot;). | [optional] |
| **street** | **String** | The full street address (example \&quot;564 Main Street, Apt 15\&quot;). | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::MortgagePropertyAddress.new(
  city: null,
  country: null,
  postal_code: null,
  region: null,
  street: null
)
```

