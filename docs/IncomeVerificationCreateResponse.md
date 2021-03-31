# Plaid::IncomeVerificationCreateResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **income_verification_id** | **String** | ID of the verification. This ID is persisted throughout the lifetime of the verification. |  |
| **request_id** | **String** | A unique identifier for the request, which can be used for troubleshooting. This identifier, like all Plaid identifiers, is case sensitive. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::IncomeVerificationCreateResponse.new(
  income_verification_id: null,
  request_id: null
)
```

