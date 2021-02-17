# Plaid::SandboxItemSetVerificationStatusRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **access_token** | **String** | The access token associated with the Item data is being requested for. |  |
| **account_id** | **String** | The &#x60;account_id&#x60; of the account whose verification status is to be modified |  |
| **verification_status** | **String** | The verification status to set the account to. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::SandboxItemSetVerificationStatusRequest.new(
  client_id: null,
  secret: null,
  access_token: null,
  account_id: null,
  verification_status: null
)
```

