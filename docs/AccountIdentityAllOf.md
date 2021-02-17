# Plaid::AccountIdentityAllOf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **owners** | [**Array&lt;Owner&gt;**](Owner.md) | Data returned by the financial institution about the account owner or owners. Only returned by Identity or Assets endpoints. Multiple owners on a single account will be represented in the same &#x60;owner&#x60; object, not in multiple owner objects within the array. |  |

## Example

```ruby
require 'plaid'

instance = Plaid::AccountIdentityAllOf.new(
  owners: null
)
```

