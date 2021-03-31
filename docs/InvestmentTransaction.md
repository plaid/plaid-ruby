# Plaid::InvestmentTransaction

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **investment_transaction_id** | **String** | The ID of the Investment transaction, unique across all Plaid transactions. Like all Plaid identifiers, the &#x60;investment_transaction_id&#x60; is case sensitive. |  |
| **cancel_transaction_id** | **String** | A legacy field formerly used internally by Plaid to identify certain canceled transactions. | [optional] |
| **account_id** | **String** | The &#x60;account_id&#x60; of the account against which this transaction posted. |  |
| **security_id** | **String** | The &#x60;security_id&#x60; to which this transaction is related. | [optional] |
| **date** | **String** | The ISO-8601 posting date for the transaction, or transacted date for pending transactions. |  |
| **name** | **String** | The institution’s description of the transaction. |  |
| **quantity** | **Float** | The number of units of the security involved in this transactions |  |
| **amount** | **Float** | The complete value of the transaction. Positive values when cash is debited, e.g. purchases of stock; negative values when cash is credited, e.g. sales of stock. Treatment remains the same for cash-only movements unassociated with securities. |  |
| **price** | **Float** | The price of the security at which this transaction occurred. |  |
| **fees** | **Float** | The combined value of all fees applied to this transaction | [optional] |
| **type** | **String** | Value is one of the following: &#x60;buy&#x60;: Buying an investment &#x60;sell&#x60;: Selling an investment &#x60;cancel&#x60;: A cancellation of a pending transaction  &#x60;cash&#x60;: Activity that modifies a cash position &#x60;fee&#x60;: A fee on the account &#x60;transfer&#x60;: Activity which modifies a position, but not through buy/sell activity e.g. options exercise, portfolio transfer |  |
| **subtype** | **String** | For descriptions of possible transaction subtypes, see [Investment transaction subtypes schema](/docs/api/accounts/#investment-transaction-subtypes-schema). |  |
| **iso_currency_code** | **String** | The ISO-4217 currency code of the transaction. Always &#x60;null&#x60; if &#x60;unofficial_currency_code&#x60; is non-&#x60;null&#x60;. | [optional] |
| **unofficial_currency_code** | **String** | The unofficial currency code associated with the holding. Always &#x60;null&#x60; if &#x60;iso_currency_code&#x60; is non-&#x60;null&#x60;. Unofficial currency codes are used for currencies that do not have official ISO currency codes, such as cryptocurrencies and the currencies of certain countries.  See the [currency code schema](/docs/api/accounts#currency-code-schema) for a full listing of supported &#x60;iso_currency_code&#x60;s. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::InvestmentTransaction.new(
  investment_transaction_id: null,
  cancel_transaction_id: null,
  account_id: null,
  security_id: null,
  date: null,
  name: null,
  quantity: null,
  amount: null,
  price: null,
  fees: null,
  type: null,
  subtype: null,
  iso_currency_code: null,
  unofficial_currency_code: null
)
```

