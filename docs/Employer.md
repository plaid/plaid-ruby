# Plaid::Employer

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **employer_id** | **String** | Plaid&#39;s unique identifier for the employer. |  |
| **name** | **String** | The name of the employer |  |
| **address** | [**NullableAddressData**](NullableAddressData.md) |  | [optional] |
| **confidence_score** | **Float** | A number from 0 to 1 indicating Plaid&#39;s level of confidence in the pairing between the employer and the institution (not yet implemented). | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::Employer.new(
  employer_id: null,
  name: null,
  address: null,
  confidence_score: null
)
```

