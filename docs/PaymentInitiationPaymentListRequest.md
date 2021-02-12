# Plaid::PaymentInitiationPaymentListRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **client_id** | **String** | Your Plaid API &#x60;client_id&#x60;. | [optional] |
| **secret** | **String** | Your Plaid API &#x60;secret&#x60;. | [optional] |
| **count** | **Integer** | The maximum number of payments to return. If &#x60;count&#x60; is not specified, a maximum of 10 payments will be returned, beginning with the most recent payment before the cursor (if specified). | [optional][default to 10] |
| **cursor** | **String** | A string in RFC 3339 format (i.e. \&quot;2019-12-06T22:35:49Z\&quot;). Only payments created before the cursor will be returned. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::PaymentInitiationPaymentListRequest.new(
  client_id: null,
  secret: null,
  count: null,
  cursor: null
)
```

