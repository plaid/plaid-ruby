# Plaid::SandboxProcessorTokenCreateRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. The &#x60;client_id&#x60; is required and may be provided either in the &#x60;PLAID-CLIENT-ID&#x60; header or as part of a request body. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. The &#x60;secret&#x60; is required and may be provided either in the &#x60;PLAID-SECRET&#x60; header or as part of a request body. | [optional] |
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

