# Plaid::SandboxItemSetVerificationStatusRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
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

