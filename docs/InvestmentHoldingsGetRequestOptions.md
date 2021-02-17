# Plaid::InvestmentHoldingsGetRequestOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_ids** | **Array&lt;String&gt;** | An array of &#x60;account_id&#x60;s to retrieve for the Item. An error will be returned if a provided &#x60;account_id&#x60; is not associated with the Item. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::InvestmentHoldingsGetRequestOptions.new(
  account_ids: null
)
```

