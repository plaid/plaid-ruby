# Plaid::AuthGetRequestOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_ids** | **Array&lt;String&gt;** | A list of &#x60;account_ids&#x60; to retrieve for the Item. Note: An error will be returned if a provided &#x60;account_id&#x60; is not associated with the Item. | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::AuthGetRequestOptions.new(
  account_ids: null
)
```

