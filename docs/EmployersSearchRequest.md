# Plaid::EmployersSearchRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **query** | **String** | The employer name to be searched for. |  |
| **products** | **Array&lt;String&gt;** | The Plaid products the returned employers should support. Currently, this field must be set to &#x60;\&quot;deposit_switch\&quot;&#x60;. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::EmployersSearchRequest.new(
  client_id: null,
  secret: null,
  query: null,
  products: null
)
```

