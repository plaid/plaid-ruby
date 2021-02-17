# Plaid::IncomeVerificationCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **webhook** | **String** | The URL endpoint to which Plaid should send webhooks related to the progress of the income verification process. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::IncomeVerificationCreateRequest.new(
  client_id: null,
  secret: null,
  webhook: null
)
```

