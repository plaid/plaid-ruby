# Plaid::LinkTokenCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **link_token** | **String** | A &#x60;link_token&#x60;, which can be supplied to Link in order to initialize it and receive a &#x60;public_token&#x60;, which can be exchanged for an &#x60;access_token&#x60;. |  |
| **expiration** | **Time** | The expiration date for the &#x60;link_token&#x60;, in ISO 8601 format. A &#x60;link_token&#x60; created to generate a &#x60;public_token&#x60; that will be exchanged for a new &#x60;access_token&#x60; expires after 4 hours. A &#x60;link_token&#x60; created for an existing Item (such as when updating an existing &#x60;access_token&#x60; by launching Link in update mode) expires after 30 minutes. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::LinkTokenCreateResponse.new(
  link_token: null,
  expiration: null,
  request_id: null
)
```

