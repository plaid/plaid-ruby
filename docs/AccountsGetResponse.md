# Plaid::AccountsGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accounts** | [**Array&lt;AccountBase&gt;**](AccountBase.md) | An array of financial institution accounts associated with the Item. If &#x60;/accounts/balance/get&#x60; was called, each account will include real-time balance information. |  |
| **item** | [**Item**](Item.md) |  |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AccountsGetResponse.new(
  accounts: null,
  item: null,
  request_id: null
)
```

