# Plaid::Email

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | **String** | The email address. |  |
| **primary** | **Boolean** | When &#x60;true&#x60;, identifies the email address as the primary email on an account. |  |
| **type** | **String** | The type of email account as described by the financial institution. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::Email.new(
  data: null,
  primary: null,
  type: null
)
```

