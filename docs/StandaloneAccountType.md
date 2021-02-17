# Plaid::StandaloneAccountType

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **depository** | **String** | An account type holding cash, in which funds are deposited. Supported products for &#x60;depository&#x60; accounts are: Auth, Balance, Transactions, Identity, Payment Initiation, and Assets. |  |
| **credit** | **String** | A credit card type account. Supported products for &#x60;credit&#x60; accounts are: Balance, Transactions, Identity, and Liabilities. |  |
| **loan** | **String** | A loan type account. Supported products for &#x60;loan&#x60; accounts are: Balance, Liabilities, and Transactions. |  |
| **investment** | **String** | An investment account. Supported products for &#x60;investment&#x60; accounts are: Balance and Investments. |  |
| **other** | **String** | Other or unknown account type. Supported products for &#x60;other&#x60; accounts are: Balance, Transactions, Identity, and Assets. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::StandaloneAccountType.new(
  depository: null,
  credit: null,
  loan: null,
  investment: null,
  other: null
)
```

