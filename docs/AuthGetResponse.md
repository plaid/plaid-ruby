# Plaid::AuthGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accounts** | [**Array&lt;AccountBase&gt;**](AccountBase.md) | The &#x60;accounts&#x60; for which numbers are being retrieved. |  |
| **numbers** | [**AuthGetNumbers**](AuthGetNumbers.md) |  |  |
| **item** | [**Item**](Item.md) |  |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AuthGetResponse.new(
  accounts: null,
  numbers: null,
  item: null,
  request_id: null
)
```

