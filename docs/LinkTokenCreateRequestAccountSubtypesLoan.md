# Plaid::LinkTokenCreateRequestAccountSubtypesLoan

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_subtypes** | [**Array&lt;AccountSubtype&gt;**](AccountSubtype.md) | An array of account subtypes to display in Link. If not specified, all account subtypes will be shown. For a full list of valid types and subtypes, see the [Account schema](/docs/api/accounts#accounts-schema).  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::LinkTokenCreateRequestAccountSubtypesLoan.new(
  account_subtypes: null
)
```
