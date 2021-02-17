# Plaid::ProcessorAuthGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |
| **numbers** | [**ProcessorNumber**](ProcessorNumber.md) |  |  |
| **account** | [**AccountBase**](AccountBase.md) |  |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ProcessorAuthGetResponse.new(
  request_id: null,
  numbers: null,
  account: null
)
```

