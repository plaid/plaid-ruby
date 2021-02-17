# Plaid::Security

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **security_id** | **String** | A unique, Plaid-specific identifier for the security, used to associate securities with holdings. Like all Plaid identifiers, the &#x60;security_id&#x60; is case sensitive. |  |
| **isin** | **String** | 12-character ISIN, a globally unique securities identifier. | [optional] |
| **cusip** | **String** | 9-character CUSIP, an identifier assigned to North American securities. | [optional] |
| **sedol** | **String** | 7-character SEDOL, an identifier assigned to securities in the UK. | [optional] |
| **institution_security_id** | **String** | An identifier given to the security by the institution | [optional] |
| **institution_id** | **String** | If &#x60;institution_security_id&#x60; is present, this field indicates the Plaid &#x60;institution_id&#x60; of the institution to whom the identifier belongs. | [optional] |
| **proxy_security_id** | **String** | In certain cases, Plaid will provide the ID of another security whose performance resembles this security, typically when the original security has low volume, or when a private security can be modeled with a publicly traded security. | [optional] |
| **name** | **String** | A descriptive name for the security, suitable for display. | [optional] |
| **ticker_symbol** | **String** | The security’s trading symbol for publicly traded securities, and otherwise a short identifier if available. | [optional] |
| **is_cash_equivalent** | **Boolean** | Indicates that a security is a highly liquid asset and can be treated like cash. | [optional] |
| **type** | **String** | The security type of the holding. Valid security types are:  &#x60;cash&#x60;: Cash, currency, and money market funds  &#x60;derivative&#x60;: Options, warrants, and other derivative instruments  &#x60;equity&#x60;: Domestic and foreign equities  &#x60;etf&#x60;: Multi-asset exchange-traded investment funds  &#x60;fixed income&#x60;: Bonds and certificates of deposit (CDs)  &#x60;loan&#x60;: Loans and loan receivables.  &#x60;mutual fund&#x60;: Open- and closed-end vehicles pooling funds of multiple investors.  &#x60;other&#x60;: Unknown or other investment types |  |
| **close_price** | **Float** | Price of the security at the close of the previous trading session. &#x60;null&#x60; for non-public securities. | [optional] |
| **close_price_as_of** | **String** | Date for which &#x60;close_price&#x60; is accurate. Always &#x60;null&#x60; if &#x60;close_price&#x60; is &#x60;null&#x60;. | [optional] |
| **iso_currency_code** | **String** | The ISO-4217 currency code of the price given. Always &#x60;null&#x60; if &#x60;unofficial_currency_code&#x60; is non-&#x60;null&#x60;. | [optional] |
| **unofficial_currency_code** | **String** | The unofficial currency code associated with the security. Always &#x60;null&#x60; if &#x60;iso_currency_code&#x60; is non-&#x60;null&#x60;. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.  See the [currency code schema](/docs/api/accounts#currency-code-schema) for a full listing of supported &#x60;iso_currency_code&#x60;s. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::Security.new(
  security_id: null,
  isin: null,
  cusip: null,
  sedol: null,
  institution_security_id: null,
  institution_id: null,
  proxy_security_id: null,
  name: null,
  ticker_symbol: null,
  is_cash_equivalent: null,
  type: null,
  close_price: null,
  close_price_as_of: null,
  iso_currency_code: null,
  unofficial_currency_code: null
)
```

