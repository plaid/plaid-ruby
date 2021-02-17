# Plaid::AccountsBalanceGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **access_token** | **String** | The access token associated with the Item data is being requested for. |  |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
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

