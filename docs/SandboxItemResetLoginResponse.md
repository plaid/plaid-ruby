# Plaid::SandboxItemResetLoginResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **reset_login** | **Boolean** | &#x60;true&#x60; if the call succeeded |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::SandboxItemResetLoginResponse.new(
  reset_login: null,
  request_id: null
)
```

