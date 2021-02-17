# Plaid::BankTransferReceiverDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **available_balance** | **String** | The sign of the available balance for the receiver bank account associated with the receiver event at the time the matching transaction was found. Can be &#x60;positive&#x60;, &#x60;negative&#x60;, or null if the balance was not available at the time. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::BankTransferReceiverDetails.new(
  available_balance: null
)
```

