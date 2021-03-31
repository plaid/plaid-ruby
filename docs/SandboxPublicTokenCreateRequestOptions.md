# Plaid::SandboxPublicTokenCreateRequestOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook** | **String** | Specify a webhook to associate with the new Item. | [optional] |
| **override_username** | **String** | Test username to use for the creation of the Sandbox Item. Default value is &#x60;user_good&#x60;. | [optional][default to &#39;user_good&#39;] |
| **override_password** | **String** | Test password to use for the creation of the Sandbox Item. Default value is &#x60;pass_good&#x60;. | [optional][default to &#39;pass_good&#39;] |
| **transactions** | [**SandboxPublicTokenCreateRequestOptionsTransactions**](SandboxPublicTokenCreateRequestOptionsTransactions.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::SandboxPublicTokenCreateRequestOptions.new(
  webhook: null,
  override_username: null,
  override_password: null,
  transactions: null
)
```

