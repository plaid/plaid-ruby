# Plaid::Numbers

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account** | **String** | Will be used for the account number. |  |
| **ach_routing** | **String** | Must be a valid ACH routing number. |  |
| **ach_wire_routing** | **String** | Must be a valid wire transfer routing number. |  |
| **eft_institution** | **String** | EFT institution number. Must be specified alongside &#x60;eft_branch&#x60;. |  |
| **eft_branch** | **String** | EFT branch number. Must be specified alongside &#x60;eft_institution&#x60;. |  |
| **international_bic** | **String** | Bank identifier code (BIC). Must be specified alongside &#x60;international_iban&#x60;. |  |
| **international_iban** | **String** | International bank account number (IBAN). If no account number is specified via &#x60;account&#x60;, will also be used as the account number by default. Must be specified alongside &#x60;international_bic&#x60;. |  |
| **bacs_sort_code** | **String** | BACS sort code |  |

## Example

```ruby
require 'plaid'

instance = Plaid::Numbers.new(
  account: null,
  ach_routing: null,
  ach_wire_routing: null,
  eft_institution: null,
  eft_branch: null,
  international_bic: null,
  international_iban: null,
  bacs_sort_code: null
)
```

