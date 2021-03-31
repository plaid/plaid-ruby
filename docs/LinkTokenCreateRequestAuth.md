# Plaid::LinkTokenCreateRequestAuth

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **auth_flow** | **String** | The optional Auth flow to use. Currently only used to enable Flexible Auth. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::LinkTokenCreateRequestAuth.new(
  auth_flow: null
)
```

