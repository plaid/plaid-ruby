# Plaid::IdentityGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **accounts** | [**Array&lt;AccountIdentity&gt;**](AccountIdentity.md) | The accounts for which Identity data has been requested |  |
| **item** | [**Item**](Item.md) |  |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::IdentityGetResponse.new(
  accounts: null,
  item: null,
  request_id: null
)
```

