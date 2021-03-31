# Plaid::AccountsBalanceGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **access_token** | **String** | The access token associated with the Item data is being requested for. |  |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **options** | [**AccountsBalanceGetRequestOptions**](AccountsBalanceGetRequestOptions.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::AccountsBalanceGetRequest.new(
  access_token: null,
  secret: null,
  client_id: null,
  options: null
)
```

