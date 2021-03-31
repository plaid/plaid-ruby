# Plaid::AuthGetNumbers

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ach** | [**Array&lt;NumbersACH&gt;**](NumbersACH.md) | An array of ACH numbers identifying accounts. | [optional] |
| **eft** | [**Array&lt;NumbersEFT&gt;**](NumbersEFT.md) | An array of EFT numbers identifying accounts. | [optional] |
| **international** | [**Array&lt;NumbersInternational&gt;**](NumbersInternational.md) | An array of IBAN numbers identifying accounts. | [optional] |
| **bacs** | [**Array&lt;NumbersBACS&gt;**](NumbersBACS.md) | An array of BACS numbers identifying accounts. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::AuthGetNumbers.new(
  ach: null,
  eft: null,
  international: null,
  bacs: null
)
```

