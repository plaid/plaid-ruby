# Plaid::Warning

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **warning_type** | **String** | The warning type, which will always be &#x60;ASSET_REPORT_WARNING&#x60; |  |
| **warning_code** | **String** | The warning code identifies a specific kind of warning. Currently, the only possible warning code is &#x60;OWNERS_UNAVAILABLE&#x60;, which indicates that account-owner information is not available. |  |
| **cause** | [**Cause**](Cause.md) |  |  |

## Example

```ruby
require 'plaid'

instance = Plaid::Warning.new(
  warning_type: null,
  warning_code: null,
  cause: null
)
```

