# Plaid::InvestmentsHoldingsGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accounts** | [**Array&lt;AccountBase&gt;**](AccountBase.md) | The accounts associated with the Item |  |
| **holdings** | [**Array&lt;Holding&gt;**](Holding.md) | The holdings belonging to investment accounts associated with the Item. Details of the securities in the holdings are provided in the &#x60;securities&#x60; field.  |  |
| **securities** | [**Array&lt;Security&gt;**](Security.md) | Objects describing the securities held in the accounts associated with the Item.  |  |
| **item** | [**Item**](Item.md) |  |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::InvestmentsHoldingsGetResponse.new(
  accounts: null,
  holdings: null,
  securities: null,
  item: null,
  request_id: null
)
```

