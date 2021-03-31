# Plaid::LiabilitiesGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accounts** | [**Array&lt;AccountBase&gt;**](AccountBase.md) | An array of accounts associated with the Item |  |
| **item** | [**Item**](Item.md) |  |  |
| **liabilities** | [**LiabilitiesObject**](LiabilitiesObject.md) |  |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::LiabilitiesGetResponse.new(
  accounts: null,
  item: null,
  liabilities: null,
  request_id: null
)
```

