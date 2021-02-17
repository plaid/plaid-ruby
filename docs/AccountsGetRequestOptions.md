# Plaid::AccountsGetRequestOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_ids** | **Array&lt;String&gt;** | An array of &#x60;account_ids&#x60; to retrieve for the Account. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::AccountsGetRequestOptions.new(
  account_ids: null
)
```

