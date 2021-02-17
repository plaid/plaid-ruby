# Plaid::StandaloneCurrencyCodeList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **iso_currency_code** | **String** | Plaid supports all ISO 4217 currency codes. |  |
| **unofficial_currency_code** | **String** | List of unofficial currency codes |  |

## Example

```ruby
require 'plaid'

instance = Plaid::StandaloneCurrencyCodeList.new(
  iso_currency_code: null,
  unofficial_currency_code: null
)
```

