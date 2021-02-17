# Plaid::VerificationExpiredWebhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_type** | **String** | &#x60;AUTH&#x60; |  |
| **webhook_code** | **String** | &#x60;VERIFICATION_EXPIRED&#x60; |  |
| **item_id** | **String** | The &#x60;item_id&#x60; of the Item associated with this webhook, warning, or error |  |
| **account_id** | **String** | The &#x60;account_id&#x60; of the account associated with the webhook |  |

## Example

```ruby
require 'plaid'

instance = Plaid::VerificationExpiredWebhook.new(
  webhook_type: null,
  webhook_code: null,
  item_id: null,
  account_id: null
)
```

