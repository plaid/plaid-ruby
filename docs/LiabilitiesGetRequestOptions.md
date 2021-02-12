# Plaid::LiabilitiesGetRequestOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_ids** | **Array&lt;String&gt;** | A list of accounts to retrieve for the Item.  An error will be returned if a provided &#x60;account_id&#x60; is not associated with the Item | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::LiabilitiesGetRequestOptions.new(
  account_ids: null
)
```

