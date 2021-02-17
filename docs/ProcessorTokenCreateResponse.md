# Plaid::ProcessorTokenCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **processor_token** | **String** | The &#x60;processor_token&#x60; that can then be used by the Plaid partner to make API requests |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ProcessorTokenCreateResponse.new(
  processor_token: null,
  request_id: null
)
```

