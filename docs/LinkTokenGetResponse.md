# Plaid::LinkTokenGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **link_token** | **String** | A &#x60;link_token&#x60;, which can be supplied to Link in order to initialize it and receive a &#x60;public_token&#x60;, which can be exchanged for an &#x60;access_token&#x60;. | [optional] |
| **created_at** | **Time** | The creation timestamp for the &#x60;link_token&#x60;, in ISO 8601 format. | [optional] |
| **expiration** | **Time** | The expiration timestamp for the &#x60;link_token&#x60;, in ISO 8601 format. | [optional] |
| **metadata** | [**LinkTokenGetMetadataResponse**](LinkTokenGetMetadataResponse.md) |  | [optional] |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::LinkTokenGetResponse.new(
  link_token: null,
  created_at: null,
  expiration: null,
  metadata: null,
  request_id: null
)
```

