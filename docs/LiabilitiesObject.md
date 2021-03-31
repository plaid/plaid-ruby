# Plaid::LiabilitiesObject

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **credit** | [**Array&lt;CreditCardLiability&gt;**](CreditCardLiability.md) | The credit accounts returned. If no credit accounts are returned, &#x60;credit&#x60; will not be present in the schema. | [optional] |
| **mortgage** | [**Array&lt;MortgageLiability&gt;**](MortgageLiability.md) | The mortgage accounts returned. If no mortgage accounts are returned, &#x60;mortgage&#x60; will not be present in the schema. | [optional] |
| **student** | [**Array&lt;StudentLoan&gt;**](StudentLoan.md) | The student loan accounts returned. If no student loan accounts are returned, &#x60;student&#x60; will not be present in the schema. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::LiabilitiesObject.new(
  credit: null,
  mortgage: null,
  student: null
)
```

