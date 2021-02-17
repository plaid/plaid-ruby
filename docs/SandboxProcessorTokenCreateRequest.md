# Plaid::SandboxProcessorTokenCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **institution_id** | **String** | The ID of the institution the Item will be associated with |  |
| **options** | [**SandboxProcessorTokenCreateRequestOptions**](SandboxProcessorTokenCreateRequestOptions.md) |  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::SandboxProcessorTokenCreateRequest.new(
  client_id: null,
  secret: null,
  institution_id: null,
  options: null
)
```

