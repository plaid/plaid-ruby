# Plaid::ItemImportRequestOptions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook** | **String** | Specifies a webhook URL to associate with an Item. Plaid fires a webhook if credentials fail.  | [optional] |

## Example

```ruby
require 'plaid'

instance = Plaid::ItemImportRequestOptions.new(
  webhook: null
)
```

