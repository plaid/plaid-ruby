# Plaid::Location

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address** | **String** | The street address where the transaction occurred. | [optional] |
| **city** | **String** | The city where the transaction occurred. | [optional] |
| **region** | **String** | The region or state where the transaction occurred. | [optional] |
| **postal_code** | **String** | The postal code where the transaction occurred. | [optional] |
| **country** | **String** | The ISO 3166-1 alpha-2 country code where the transaction occurred. | [optional] |
| **lat** | **Float** | The latitude where the transaction occurred. | [optional] |
| **lon** | **Float** | The longitude where the transaction occurred. | [optional] |
| **store_number** | **String** | The merchant defined store number where the transaction occurred. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::Location.new(
  address: null,
  city: null,
  region: null,
  postal_code: null,
  country: null,
  lat: null,
  lon: null,
  store_number: null
)
```

