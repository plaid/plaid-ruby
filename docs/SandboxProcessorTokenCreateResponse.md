# Plaid::SandboxProcessorTokenCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **processor_token** | **String** | A processor token that can be used to call the &#x60;/processor/&#x60; endpoints. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::SandboxProcessorTokenCreateResponse.new(
  processor_token: null,
  request_id: null
)
```

