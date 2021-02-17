# Plaid::ProcessorAuthGetRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **processor_token** | **String** | The processor token obtained from the Plaid integration partner. Processor tokens are in the format: &#x60;processor-&lt;environment&gt;-&lt;identifier&gt;&#x60; |  |

## Example

```ruby
require 'plaid'

instance = Plaid::ProcessorAuthGetRequest.new(
  client_id: null,
  secret: null,
  processor_token: null
)
```

