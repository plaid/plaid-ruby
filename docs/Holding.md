# Plaid::Holding

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | The Plaid &#x60;account_id&#x60; associated with the holding. |  |
| **security_id** | **String** | The Plaid &#x60;security_id&#x60; associated with the holding. |  |
| **institution_price** | **Float** | The last price given by the institution for this security. |  |
| **institution_price_as_of** | **String** | The date at which &#x60;institution_price&#x60; was current. | [optional] |
| **institution_value** | **Float** | The value of the holding, as reported by the institution. |  |
| **cost_basis** | **Float** | The cost basis of the holding. | [optional] |
| **quantity** | **Float** | The total quantity of the asset held, as reported by the financial institution. |  |
| **iso_currency_code** | **String** | The ISO-4217 currency code of the holding. Always &#x60;null&#x60; if &#x60;unofficial_currency_code&#x60; is non-&#x60;null&#x60;. | [optional] |
| **unofficial_currency_code** | **String** | The unofficial currency code associated with the holding. Always &#x60;null&#x60; if &#x60;iso_currency_code&#x60; is non-&#x60;null&#x60;. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.  See the [currency code schema](/docs/api/accounts#currency-code-schema) for a full listing of supported &#x60;iso_currency_code&#x60;s.  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::Holding.new(
  account_id: null,
  security_id: null,
  institution_price: null,
  institution_price_as_of: null,
  institution_value: null,
  cost_basis: null,
  quantity: null,
  iso_currency_code: null,
  unofficial_currency_code: null
)
```

