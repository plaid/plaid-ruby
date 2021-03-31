# Plaid::ItemImportRequestUserAuth

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **user_id** | **String** | Opaque user identifier |  |
| **auth_token** | **String** | Authorization token Plaid will use to aggregate this user’s accounts |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemImportRequestUserAuth.new(
  user_id: null,
  auth_token: null
)
```

