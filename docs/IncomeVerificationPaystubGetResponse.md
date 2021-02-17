# Plaid::IncomeVerificationPaystubGetResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **paystub** | [**Paystub**](Paystub.md) |  | [optional] |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::IncomeVerificationPaystubGetResponse.new(
  paystub: null,
  request_id: null
)
```

